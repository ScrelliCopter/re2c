// re2v -f $INPUT -o $OUTPUT

import log
import os

// Use a small buffer to cover the case when a lexeme doesn't fit.
// In real world use a larger buffer.
const bufsize = 10

struct State {
mut:
    file    os.File
    str     []u8
    cur     int
    mar     int
    tok     int
    lim     int
    yystate int
}

enum Status {
    lex_end
    lex_ready
    lex_waiting
    lex_bad_packet
    lex_big_packet
}

fn fill(mut st &State) Status {
    shift := st.tok
    used := st.lim - st.tok
    free := bufsize - used

    // Error: no space. In real life can reallocate a larger buffer.
    if free < 1 { return .lex_big_packet }

    // Shift buffer contents (discard already processed data).
    copy(mut &st.str, st.str[shift..shift+used])
    st.cur -= shift
    st.mar -= shift
    st.lim -= shift
    st.tok -= shift

    // Fill free space at the end of buffer with new data.
    pos := st.file.tell() or { 0 }
    if n := st.file.read_bytes_into(u64(pos), mut st.str[st.lim..bufsize]) {
        st.lim += n
    }
    st.str[st.lim] = 0 // append sentinel symbol

    return .lex_ready
}

fn lex(mut yyrecord &State, mut recv &int) Status {
    mut yych := u8(0)
    /*!getstate:re2c*/
loop:
    yyrecord.tok = yyrecord.cur
    /*!re2c
        re2c:api = record;
        re2c:eof = 0;
        re2c:define:YYFILL = "return .lex_waiting";

        packet = [a-z]+[;];

        *      { return .lex_bad_packet }
        $      { return .lex_end }
        packet { recv += 1; unsafe{ goto loop } }
    */
}

fn test(expect Status, packets []string) {
    // Create a "socket" (open the same file for reading and writing).
    fname := "pipe"
    mut fw := os.create(fname) or { panic("cannot create file") }
    mut fr := os.open(fname) or { panic("cannot open file") }

    // Initialize lexer state: `state` value is -1, all offsets are at the end
    // of buffer.
    mut st := &State{
        file:    fr,
        // Sentinel at `lim` offset is set to zero, which triggers YYFILL.
        str:     []u8{len: bufsize + 1},
        cur:     bufsize,
        mar:     bufsize,
        tok:     bufsize,
        lim:     bufsize,
        yystate: -1,
    }

    // Main loop. The buffer contains incomplete data which appears packet by
    // packet. When the lexer needs more input it saves its internal state and
    // returns to the caller which should provide more input and resume lexing.
    mut status := Status.lex_ready
    mut send := 0
    mut recv := 0
    for {
        status = lex(mut st, mut &recv)
        if status == .lex_end {
            break
        } else if status == .lex_waiting {
            if send < packets.len {
                log.debug("sending packet $send")
                fw.write_string(packets[send]) or { panic("cannot write to file") }
                fw.flush()
                send += 1
            }
            status = fill(mut st)
            log.debug("filled buffer $st.str, status $status")
            if status != .lex_ready {
                break
            }
        } else if status == .lex_bad_packet {
            break
        }
    }

    // Check results.
    if status != expect || (status == .lex_end && recv != send) {
        panic("expected $expect with $send packet(s), got $status with $recv packet(s)")
    }

    // Cleanup: remove input file.
    fr.close()
    fw.close()
    os.rm(fname) or { panic("cannot remove file") }
}

fn main() {
    //log.set_level(.debug)

    test(.lex_end, [])
    test(.lex_end, ["zero;", "one;", "two;", "three;", "four;"])
    test(.lex_bad_packet, ["??;"])
    test(.lex_big_packet, ["looooooooooooong;"])
}
