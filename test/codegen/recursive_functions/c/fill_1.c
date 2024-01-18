/* Generated by re2c */
// re2c $INPUT -o $OUTPUT --recursive-functions -i
#include <assert.h>
#include <stdio.h>
#include <string.h>

#define SIZE 4096

typedef struct {
    FILE *file;
    char buf[SIZE + 1], *lim, *cur, *mar, *tok;
    int eof;
} Input;

static int fill(Input *in)
{
    if (in->eof) {
        return 1;
    }
    const size_t free = in->tok - in->buf;
    if (free < 1) {
        return 2;
    }
    memmove(in->buf, in->tok, in->lim - in->tok);
    in->lim -= free;
    in->cur -= free;
    in->mar -= free;
    in->tok -= free;
    in->lim += fread(in->lim, 1, free, in->file);
    in->lim[0] = 0;
    in->eof |= in->lim < in->buf + SIZE;
    return 0;
}

static void init(Input *in, FILE *file)
{
    in->file = file;
    in->cur = in->mar = in->tok = in->lim = in->buf + SIZE;
    in->eof = 0;
    fill(in);
}

static int lex_loop(Input *in, int count);


static int yy0(Input* in, int count);
static int yy1(Input* in, int count);
static int yy2(Input* in, int count);
static int yy3(Input* in, int count);
static int yy4(Input* in, int count);
static int yy5(Input* in, int count);
static int yy6(Input* in, int count);
static int yy7(Input* in, int count, char yych);
static int yy8(Input* in, int count);
static int yy9(Input* in, int count);
static int yy10(Input* in, int count);
static int yy11(Input* in, int count);
static int lex(Input* in, int count);

static int yy0(Input* in, int count) {
	char yych = *in->cur;
	switch (yych) {
		case ' ':
			++in->cur;
			return yy3(in, count);
		case '\'':
			++in->cur;
			return yy5(in, count);
		default:
			if (in->lim <= in->cur) {
				if (fill(in) == 0) return yy0(in, count);
				else return yy10(in, count);
			} else {
				++in->cur;
				return yy1(in, count);
			}
	}
}

static int yy1(Input* in, int count) {
	return yy2(in, count);
}

static int yy2(Input* in, int count) {
	{ return -1; }
}

static int yy3(Input* in, int count) {
	char yych = *in->cur;
	switch (yych) {
		case ' ':
			++in->cur;
			return yy3(in, count);
		default:
			if (in->lim <= in->cur) {
				if (fill(in) == 0) return yy3(in, count);
				else return yy4(in, count);
			} else {
				return yy4(in, count);
			}
	}
}

static int yy4(Input* in, int count) {
	{ return lex_loop(in, count); }
}

static int yy5(Input* in, int count) {
	char yych = *(in->mar = in->cur);
	if (yych <= 0x00) {
		if (in->lim <= in->cur) {
			if (fill(in) == 0) return yy5(in, count);
			else return yy2(in, count);
		} else {
			++in->cur;
			return yy6(in, count);
		}
	} else {
		return yy7(in, count, yych);
	}
}

static int yy6(Input* in, int count) {
	char yych = *in->cur;
	return yy7(in, count, yych);
}

static int yy7(Input* in, int count, char yych) {
	switch (yych) {
		case '\'':
			++in->cur;
			return yy8(in, count);
		case '\\':
			++in->cur;
			return yy9(in, count);
		default:
			if (in->lim <= in->cur) {
				if (fill(in) == 0) return yy6(in, count);
				else return yy11(in, count);
			} else {
				++in->cur;
				return yy6(in, count);
			}
	}
}

static int yy8(Input* in, int count) {
	{ return lex_loop(in, count + 1); }
}

static int yy9(Input* in, int count) {
	char yych = *in->cur;
	if (yych <= 0x00) {
		if (in->lim <= in->cur) {
			if (fill(in) == 0) return yy9(in, count);
			else return yy11(in, count);
		} else {
			++in->cur;
			return yy6(in, count);
		}
	} else {
		++in->cur;
		return yy6(in, count);
	}
}

static int yy10(Input* in, int count) {
	{ return count; }
}

static int yy11(Input* in, int count) {
	in->cur = in->mar;
	return yy2(in, count);
}

static int lex(Input* in, int count) {
	return yy0(in, count);
}



static int lex_loop(Input *in, int count)
{
    in->tok = in->cur;
    return lex(in, count);
}

int main()
{
    const char *fname = "input";
    const char str[] = "'qu\0tes' 'are' 'fine: \\'' ";
    FILE *f;
    Input in;

    // prepare input file: a few times the size of the buffer,
    // containing strings with zeroes and escaped quotes
    f = fopen(fname, "w");
    for (int i = 0; i < SIZE; ++i) {
        fwrite(str, 1, sizeof(str) - 1, f);
    }
    fclose(f);

    f = fopen(fname, "r");
    init(&in, f);
    assert(lex_loop(&in, 0) == SIZE * 3);
    fclose(f);

    remove(fname);
    return 0;
}
