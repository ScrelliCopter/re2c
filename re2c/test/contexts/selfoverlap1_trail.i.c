/* Generated by re2c */
#include <stddef.h>
#include <stdio.h>

static void lex(const char *YYCURSOR)
{
    const char *YYCTXMARKER;
    const char *token = YYCURSOR;
    
{
	char yych;
	yych = *YYCURSOR;
	switch (yych) {
	case 'a':	goto yy4;
	default:	goto yy2;
	}
yy2:
	++YYCURSOR;
yy3:
	{ printf("error\n"); return; }
yy4:
	yych = *++YYCURSOR;
	switch (yych) {
	case 'a':
		YYCTXMARKER = YYCURSOR;
		goto yy5;
	default:	goto yy3;
	}
yy5:
	++YYCURSOR;
	yych = *YYCURSOR;
	switch (yych) {
	case 'a':
		YYCTXMARKER = YYCURSOR;
		goto yy5;
	default:	goto yy7;
	}
yy7:
	YYCURSOR = YYCTXMARKER;
	{
            printf("'%.*s', '%s'\n",
                YYCURSOR - token, token,
                YYCURSOR);
                return;
        }
}

}

int main(int argc, char **argv)
{
    for (int i = 1; i < argc; ++i) {
        lex(argv[i]);
    }
    return 0;
}
re2c: warning: line 19: trailing context is self-overlapping [-Wselfoverlapping-contexts]
