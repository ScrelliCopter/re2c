/* Generated by re2c */
#include <stddef.h>
#include <stdio.h>

static inline unsigned parse_oct(const char *s, const char *e)
{
    unsigned oct = 0;
    for (; s != e; ++s) {
        oct = oct * 10 + *s - '0';
    }
    return oct;
}

static void lex(const char *YYCURSOR)
{
    const char *YYMARKER;
    const char *YYCTXMARKER;
    
    ptrdiff_t zz_0p1 = 0, zz_0p2 = 0, zz_0p3 = 0;
    
{
	char yych;
	YYCTXMARKER = YYCURSOR;
	yych = *YYCURSOR;
	switch (yych) {
	case '0':
	case '1':
	case '2':
	case '3':
	case '4':
	case '5':
	case '6':
	case '7':
	case '8':
	case '9':	goto yy4;
	default:	goto yy2;
	}
yy2:
	++YYCURSOR;
yy3:
	{ printf("error\n"); return; }
yy4:
	yych = *(YYMARKER = ++YYCURSOR);
	switch (yych) {
	case '.':
		zz_0p1 = (YYCURSOR - YYCTXMARKER);
		goto yy5;
	case '0':
	case '1':
	case '2':
	case '3':
	case '4':
	case '5':
	case '6':
	case '7':
	case '8':
	case '9':	goto yy7;
	default:	goto yy3;
	}
yy5:
	yych = *++YYCURSOR;
	switch (yych) {
	case '0':
	case '1':
	case '2':
	case '3':
	case '4':
	case '5':
	case '6':
	case '7':
	case '8':
	case '9':	goto yy8;
	default:	goto yy6;
	}
yy6:
	YYCURSOR = YYMARKER;
	goto yy3;
yy7:
	yych = *++YYCURSOR;
	switch (yych) {
	case '.':
		zz_0p1 = (YYCURSOR - YYCTXMARKER);
		goto yy5;
	case '0':
	case '1':
	case '2':
	case '3':
	case '4':
	case '5':
	case '6':
	case '7':
	case '8':
	case '9':	goto yy9;
	default:	goto yy6;
	}
yy8:
	yych = *++YYCURSOR;
	switch (yych) {
	case '.':
		zz_0p2 = (YYCURSOR - YYCTXMARKER);
		goto yy10;
	case '0':
	case '1':
	case '2':
	case '3':
	case '4':
	case '5':
	case '6':
	case '7':
	case '8':
	case '9':	goto yy11;
	default:	goto yy6;
	}
yy9:
	yych = *++YYCURSOR;
	switch (yych) {
	case '.':
		zz_0p1 = (YYCURSOR - YYCTXMARKER);
		goto yy5;
	default:	goto yy6;
	}
yy10:
	yych = *++YYCURSOR;
	switch (yych) {
	case '0':
	case '1':
	case '2':
	case '3':
	case '4':
	case '5':
	case '6':
	case '7':
	case '8':
	case '9':	goto yy12;
	default:	goto yy6;
	}
yy11:
	yych = *++YYCURSOR;
	switch (yych) {
	case '.':
		zz_0p2 = (YYCURSOR - YYCTXMARKER);
		goto yy10;
	case '0':
	case '1':
	case '2':
	case '3':
	case '4':
	case '5':
	case '6':
	case '7':
	case '8':
	case '9':	goto yy13;
	default:	goto yy6;
	}
yy12:
	yych = *++YYCURSOR;
	switch (yych) {
	case '.':
		zz_0p3 = (YYCURSOR - YYCTXMARKER);
		goto yy14;
	case '0':
	case '1':
	case '2':
	case '3':
	case '4':
	case '5':
	case '6':
	case '7':
	case '8':
	case '9':	goto yy15;
	default:	goto yy6;
	}
yy13:
	yych = *++YYCURSOR;
	switch (yych) {
	case '.':
		zz_0p2 = (YYCURSOR - YYCTXMARKER);
		goto yy10;
	default:	goto yy6;
	}
yy14:
	yych = *++YYCURSOR;
	switch (yych) {
	case '0':
	case '1':
	case '2':
	case '3':
	case '4':
	case '5':
	case '6':
	case '7':
	case '8':
	case '9':	goto yy16;
	default:	goto yy6;
	}
yy15:
	yych = *++YYCURSOR;
	switch (yych) {
	case '.':
		zz_0p3 = (YYCURSOR - YYCTXMARKER);
		goto yy14;
	case '0':
	case '1':
	case '2':
	case '3':
	case '4':
	case '5':
	case '6':
	case '7':
	case '8':
	case '9':	goto yy18;
	default:	goto yy6;
	}
yy16:
	++YYCURSOR;
	switch ((yych = *YYCURSOR)) {
	case '0':
	case '1':
	case '2':
	case '3':
	case '4':
	case '5':
	case '6':
	case '7':
	case '8':
	case '9':	goto yy19;
	default:	goto yy17;
	}
yy17:
	{
            printf("%u.%u.%u.%u\n",
                parse_oct(YYCTXMARKER, (YYCTXMARKER + zz_0p1)),
                parse_oct((YYCTXMARKER + zz_0p1) + 1, (YYCTXMARKER + zz_0p2)),
                parse_oct((YYCTXMARKER + zz_0p2) + 1, (YYCTXMARKER + zz_0p3)),
                parse_oct((YYCTXMARKER + zz_0p3) + 1, YYCURSOR));
            return;
        }
yy18:
	yych = *++YYCURSOR;
	switch (yych) {
	case '.':
		zz_0p3 = (YYCURSOR - YYCTXMARKER);
		goto yy14;
	default:	goto yy6;
	}
yy19:
	yych = *++YYCURSOR;
	switch (yych) {
	case '0':
	case '1':
	case '2':
	case '3':
	case '4':
	case '5':
	case '6':
	case '7':
	case '8':
	case '9':	goto yy20;
	default:	goto yy17;
	}
yy20:
	++YYCURSOR;
	yych = *YYCURSOR;
	goto yy17;
}

}

int main(int argc, char **argv)
{
    for (int i = 1; i < argc; ++i) {
        lex(argv[i]);
    }
    return 0;
}
