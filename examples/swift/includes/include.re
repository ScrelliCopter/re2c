// re2swift $INPUT -o $OUTPUT --api simple

/*!include:re2c "definitions.swift" */

func lex(_ yyinput: UnsafePointer<UInt8>) -> Result {
  var yycursor = 0, yymarker = 0
  /*!re2c
    re2c:yyfill:enable = 0;

    *      { return .fail }
    number { return .ok }
    !include "extra_rules.re.inc";
  */
}

assert(lex("123") == .ok)
assert(lex("123.4567") == .ok)
