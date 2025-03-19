// re2swift $INPUT -o $OUTPUT -i --header lexer/state.swift

/*!header:re2c:on*/
struct LexerState {
  var str: UnsafePointer<UInt8>
  var cur = 0
  /*!stags:re2c format = "var @@ = -1"; */
}
/*!header:re2c:off*/

extension LexerState {
  mutating func lex() -> Int {
  let t: Int
  /*!re2c
    re2c:header        = "lexer/state.swift";
    re2c:api           = record;
    re2c:tags          = 1;
    re2c:yyfill:enable = 0;
    re2c:yyrecord      = "self";
    re2c:YYCURSOR      = "cur";
    re2c:YYINPUT       = "str";

    [a]* @t [b]* { return t }
  */
  }
}

@main struct Program {
  static func main() {
    let str: StaticString = "ab"
    var state = LexerState(str: str.utf8Start, cur: 0)
    assert(state.lex() == 1)
  }
}
