// Generated by re2zig
// re2zig $INPUT -o $OUTPUT --recursive-functions

const std = @import("std");

const State = struct {
    str: [:0]const u8,
    cur: u32,
};

const SyntaxError = error {
    UnexpectedCharacter
};


fn yy0(st: *State) SyntaxError!void {
    const yych = st.str[st.cur];
    st.cur += 1;
    switch (yych) {
        0x31...0x39 => { return try yy2(st); },
        else => { return try yy1(st); },
    }
}

fn yy1(st: *State) SyntaxError!void {
    _ = st; return SyntaxError.UnexpectedCharacter;
}

fn yy2(st: *State) SyntaxError!void {
    const yych = st.str[st.cur];
    switch (yych) {
        0x30...0x39 => {
            st.cur += 1;
            return try yy2(st);
        },
        else => { return try yy3(st); },
    }
}

fn yy3(st: *State) SyntaxError!void {
    _ = st; return;
}

fn lex(st: *State) SyntaxError!void {
    return try yy0(st);
}



test {
    var st = State{.str = "1234", .cur = 0};
    try lex(&st);
}
