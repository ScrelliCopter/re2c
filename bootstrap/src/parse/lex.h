/* Generated by re2c 3.0 on Tue Jul  5 21:53:09 2022 */

#ifndef _RE2C_PARSE_LEX_
#define _RE2C_PARSE_LEX_

#include <stddef.h>
#include <string.h>
#include "src/util/forbid_copy.h"

namespace re2c {

#line 13 "src/parse/lex.h"
#define YYMAXFILL 18
#line 73 "../src/parse/lex.re"


struct ScannerState {
    enum class LexMode: uint32_t { NORMAL, FLEX_NAME };

    LexMode mode;
    size_t BSIZE;
    char* bot, *lim, *cur, *mar, *ctx, *tok, *ptr, *pos, *eof;
    
#line 25 "src/parse/lex.h"
char *yyt1;char *yyt2;char *yyt3;
#line 81 "../src/parse/lex.re"


    inline ScannerState()
        : mode(LexMode::NORMAL),
          BSIZE(8192),
          bot(new char[BSIZE + YYMAXFILL]),
          lim(bot + BSIZE),
          cur(lim),
          mar(lim),
          ctx(lim),
          tok(lim),
          ptr(lim),
          pos(lim),
          eof(nullptr)
          
#line 43 "src/parse/lex.h"
, yyt1(lim), yyt2(lim), yyt3(lim)
#line 95 "../src/parse/lex.re"
 {
        memset(lim, 0, YYMAXFILL);
    }

    inline ~ScannerState() {
        delete[] bot;
    }

    inline void shift_ptrs(ptrdiff_t offs) {
        lim += offs;
        cur += offs;
        mar += offs;
        ctx += offs;
        tok += offs;
        ptr += offs;
        pos += offs;
        
#line 63 "src/parse/lex.h"
if (yyt1) { yyt1 += offs; }if (yyt2) { yyt2 += offs; }if (yyt3) { yyt3 += offs; }
#line 111 "../src/parse/lex.re"

    }

    FORBID_COPY(ScannerState);
};

} // namespace re2c

#endif // _RE2C_PARSE_LEX_
