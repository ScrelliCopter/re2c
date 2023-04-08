/* Generated by re2c */
// re2c $INPUT -o $OUTPUT -i --posix-captures --fixed-tags toplevel

// In POSIX mode grous capture non-empty string: the first iteration consumes
// all 'a's, and subsequent iterations are bypassed on the epsilon-transitions.
// It is a POSIX rule that there should be no optional empty repetitions.

// In leftmost mode groups capture empty string: the first iteration consumes
// all 'a's, but subsequent iterations aren't bypassed (by TNFA construction
// they have lower priority).


{
	YYCTYPE yych;
	if (YYLIMIT <= YYCURSOR) YYFILL(1);
	yych = *YYCURSOR;
	switch (yych) {
		case 'a':
			yyt1 = YYCURSOR;
			goto yy2;
		default:
			yyt1 = yyt2 = YYCURSOR;
			goto yy1;
	}
yy1:
	yynmatch = 3;
	yypmatch[0] = yyt1;
	yypmatch[2] = yyt1;
	yypmatch[3] = yyt2;
	yypmatch[4] = yyt1;
	yypmatch[5] = yyt2;
	yypmatch[1] = YYCURSOR;
	{}
yy2:
	++YYCURSOR;
	if (YYLIMIT <= YYCURSOR) YYFILL(1);
	yych = *YYCURSOR;
	switch (yych) {
		case 'a': goto yy2;
		default:
			yyt2 = YYCURSOR;
			goto yy1;
	}
}

captures/closure2_posix.re:12:24: warning: rule matches empty string [-Wmatch-empty-string]
