/* Generated by re2c */

{
	YYCTYPE yych;
	switch (YYGETCONDITION()) {
	case yycc1: goto yyc_c1;
	case yycc2: goto yyc_c2;
	}
/* *********************************** */
yyc_c1:
	if (YYLESSTHAN (3)) YYFILL(3);
	yych = YYPEEK ();
	switch (yych) {
	case 'a':	goto yy5;
	default:	goto yy3;
	}
yy3:
	YYSKIP ();
	{}
yy5:
	YYSKIP ();
	YYBACKUPCTX ();
	switch ((yych = YYPEEK ())) {
	case 'b':	goto yy7;
	default:	goto yy6;
	}
yy6:
	YYRESTORECTX ();
	{}
yy7:
	YYSKIP ();
	switch ((yych = YYPEEK ())) {
	case 'b':	goto yy9;
	case 'c':
		YYBACKUPCTX ();
		goto yy11;
	default:
		YYBACKUPCTX ();
		goto yy8;
	}
yy8:
	YYRESTORECTX ();
	{}
yy9:
	YYSKIP ();
	if (YYLESSTHAN (1)) YYFILL(1);
	yych = YYPEEK ();
	switch (yych) {
	case 'b':	goto yy9;
	default:	goto yy6;
	}
yy11:
	YYSKIP ();
	if (YYLESSTHAN (1)) YYFILL(1);
	yych = YYPEEK ();
	switch (yych) {
	case 'c':	goto yy11;
	default:	goto yy8;
	}
/* *********************************** */
yyc_c2:
	if (YYLESSTHAN (2)) YYFILL(2);
	yych = YYPEEK ();
	switch (yych) {
	case 'a':	goto yy17;
	default:	goto yy15;
	}
yy15:
	YYSKIP ();
	{}
yy17:
	YYSKIP ();
	YYBACKUPCTX ();
	switch ((yych = YYPEEK ())) {
	case 'b':	goto yy19;
	case 'c':	goto yy22;
	default:	goto yy18;
	}
yy18:
	YYRESTORECTX ();
	{}
yy19:
	YYSKIP ();
	if (YYLESSTHAN (1)) YYFILL(1);
	yych = YYPEEK ();
	switch (yych) {
	case 'b':	goto yy19;
	default:	goto yy21;
	}
yy21:
	YYRESTORECTX ();
	{}
yy22:
	YYSKIP ();
	if (YYLESSTHAN (1)) YYFILL(1);
	yych = YYPEEK ();
	switch (yych) {
	case 'c':	goto yy22;
	default:	goto yy18;
	}
}

