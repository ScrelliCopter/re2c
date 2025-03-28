/* Generated by re2d */
// re2d $INPUT -o $OUTPUT -i
module main;

private bool lex(const(char)* yycursor) {
    const(char)* yymarker;
    
{
    char yych;
    yych = *yycursor;
    switch (yych) {
        case 0x07: goto yy3;
        default: goto yy1;
    }
yy1:
    ++yycursor;
yy2:
    {
            auto _ = ['\a', '\b', '\f', '\n', '\r', '\t', '\v', '\\', '\'', '\"']; // unused
            return false;
        }
yy3:
    yych = *(yymarker = ++yycursor);
    switch (yych) {
        case 0x08: goto yy4;
        default: goto yy2;
    }
yy4:
    yych = *++yycursor;
    switch (yych) {
        case '\f': goto yy6;
        default: goto yy5;
    }
yy5:
    yycursor = yymarker;
    goto yy2;
yy6:
    yych = *++yycursor;
    switch (yych) {
        case '\n': goto yy7;
        default: goto yy5;
    }
yy7:
    yych = *++yycursor;
    switch (yych) {
        case '\r': goto yy8;
        default: goto yy5;
    }
yy8:
    yych = *++yycursor;
    switch (yych) {
        case '\t': goto yy9;
        default: goto yy5;
    }
yy9:
    yych = *++yycursor;
    switch (yych) {
        case '\v': goto yy10;
        default: goto yy5;
    }
yy10:
    yych = *++yycursor;
    switch (yych) {
        case '\\': goto yy11;
        default: goto yy5;
    }
yy11:
    yych = *++yycursor;
    switch (yych) {
        case '\'': goto yy12;
        default: goto yy5;
    }
yy12:
    yych = *++yycursor;
    switch (yych) {
        case '"': goto yy13;
        default: goto yy5;
    }
yy13:
    ++yycursor;
    { return true; }
}

}

void main() {
    assert(lex("\x07\x08\x0c\x0a\x0d\x09\x0b\\'\""));
}
