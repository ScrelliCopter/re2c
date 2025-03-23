/* Generated by re2swift */
#sourceLocation(file: "codegen/swift/recursive_functions/advanced.re", line: 1)
// re2swift $INPUT -o $OUTPUT --api generic --recursive-functions -cf
import Foundation

func log(_ items: Any..., separator: String = " ", terminator: String = "\n") {
#if DEBUG
  var stderr = FileHandle.standardError
  print(items, separator: separator, terminator: terminator, to: &stderr)
#endif
}

extension FileHandle: @retroactive TextOutputStream {
  public func write(_ string: String) {
    self.write(Data(string.utf8))
  }
}

#sourceLocation(file: "codegen/swift/recursive_functions/advanced.swift", line: 20)
let yycmedia_type: Int = 1
let yycheader: Int = 23
#sourceLocation(file: "codegen/swift/recursive_functions/advanced.re", line: 17)

let bufferSize = 4096-32-248-1
let tagNone = -1

class State {
  init() {}

  var cursor = bufferSize
  var marker = bufferSize
  var token  = bufferSize
  var limit  = bufferSize
  var cond   = yycmedia_type
  var state  = -1
  var accept = 0

  private var mTagPool = [MTag]()

  
#sourceLocation(file: "codegen/swift/recursive_functions/advanced.swift", line: 42)
  var yyt1 = tagNone
  var yyt2 = tagNone
#sourceLocation(file: "codegen/swift/recursive_functions/advanced.re", line: 34)

  
#sourceLocation(file: "codegen/swift/recursive_functions/advanced.swift", line: 48)
  var yytm1: MTag? = nil
  var yytm10: MTag? = nil
  var yytm2: MTag? = nil
  var yytm3: MTag? = nil
  var yytm4: MTag? = nil
  var yytm5: MTag? = nil
  var yytm6: MTag? = nil
  var yytm7: MTag? = nil
  var yytm8: MTag? = nil
  var yytm9: MTag? = nil
#sourceLocation(file: "codegen/swift/recursive_functions/advanced.re", line: 35)



  var l1 = 0, l2 = 0
  var f1: MTag? = nil, f2: MTag? = nil
  var p1: MTag? = nil, p2: MTag? = nil, p3: MTag? = nil, p4: MTag? = nil

  // Buffer is zero-initialized, no need to write sentinel
  var buffer = ContiguousArray<UInt8>(repeating: 0, count: bufferSize + 1)
}


#sourceLocation(file: "codegen/swift/recursive_functions/advanced.swift", line: 72)
func yy1(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x21:
      fallthrough
    case 0x23...0x27:
      fallthrough
    case 0x2A...0x2B:
      fallthrough
    case 0x2D...0x2E:
      fallthrough
    case 0x30...0x39:
      fallthrough
    case 0x41...0x5A:
      fallthrough
    case 0x5E...0x7A:
      fallthrough
    case 0x7C:
      fallthrough
    case 0x7E:
      s.yyt1 = s.cursor
      s.cursor += 1
      return try yy4(s)
    default:
      if s.limit <= s.cursor {
        s.state = 0
        return .waiting
      } else {
        s.cursor += 1
        return try yy2(s)
      }
  }
}

func yy2(_ s: State) throws(ParseError) -> State.Status {
  return try yy3(s)
}

func yy3(_ s: State) throws(ParseError) -> State.Status {
  s.state = -1
#sourceLocation(file: "codegen/swift/recursive_functions/advanced.re", line: 126)
  throw .unexpectedCharacter
#sourceLocation(file: "codegen/swift/recursive_functions/advanced.swift", line: 115)
}

func yy4(_ s: State) throws(ParseError) -> State.Status {
  s.marker = s.cursor
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x21:
      fallthrough
    case 0x23...0x27:
      fallthrough
    case 0x2A...0x2B:
      fallthrough
    case 0x2D...0x39:
      fallthrough
    case 0x41...0x5A:
      fallthrough
    case 0x5E...0x7A:
      fallthrough
    case 0x7C:
      fallthrough
    case 0x7E: return try yy6(s, yych)
    default:
      if s.limit <= s.cursor {
        s.state = 1
        return .waiting
      } else {
        return try yy3(s)
      }
  }
}

func yy5(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  return try yy6(s, yych)
}

func yy6(_ s: State, _ yych: UInt8) throws(ParseError) -> State.Status {
  switch yych {
    case 0x21:
      fallthrough
    case 0x23...0x27:
      fallthrough
    case 0x2A...0x2B:
      fallthrough
    case 0x2D...0x2E:
      fallthrough
    case 0x30...0x39:
      fallthrough
    case 0x41...0x5A:
      fallthrough
    case 0x5E...0x7A:
      fallthrough
    case 0x7C:
      fallthrough
    case 0x7E:
      s.cursor += 1
      return try yy5(s)
    case 0x2F:
      s.cursor += 1
      return try yy8(s)
    default:
      if s.limit <= s.cursor {
        s.state = 2
        return .waiting
      } else {
        return try yy7(s)
      }
  }
}

func yy7(_ s: State) throws(ParseError) -> State.Status {
  s.cursor = s.marker
  return try yy3(s)
}

func yy8(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x00:
      fallthrough
    case 0x09:
      fallthrough
    case 0x0D:
      fallthrough
    case 0x20:
      fallthrough
    case 0x3B:
      if s.limit <= s.cursor {
        s.state = 3
        return .waiting
      } else {
        return try yy7(s)
      }
    default: return try yy10(s, yych)
  }
}

func yy9(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  return try yy10(s, yych)
}

func yy10(_ s: State, _ yych: UInt8) throws(ParseError) -> State.Status {
  switch yych {
    case 0x09:
      fallthrough
    case 0x20:
      s.yytm6 = s.yytm10
      s.yytm6 = s.add(tag: s.yytm6, value: tagNone)
      s.yytm5 = s.yytm9
      s.yytm5 = s.add(tag: s.yytm5, value: tagNone)
      s.yytm4 = s.yytm8
      s.yytm4 = s.add(tag: s.yytm4, value: tagNone)
      s.yytm3 = s.yytm7
      s.yytm3 = s.add(tag: s.yytm3, value: tagNone)
      s.yyt2 = s.cursor
      s.cursor += 1
      return try yy11(s)
    case 0x0D:
      s.yytm6 = s.yytm10
      s.yytm6 = s.add(tag: s.yytm6, value: tagNone)
      s.yytm5 = s.yytm9
      s.yytm5 = s.add(tag: s.yytm5, value: tagNone)
      s.yytm4 = s.yytm8
      s.yytm4 = s.add(tag: s.yytm4, value: tagNone)
      s.yytm3 = s.yytm7
      s.yytm3 = s.add(tag: s.yytm3, value: tagNone)
      s.yyt2 = s.cursor
      s.cursor += 1
      return try yy12(s)
    case 0x21:
      fallthrough
    case 0x23...0x27:
      fallthrough
    case 0x2A...0x2B:
      fallthrough
    case 0x2D...0x2E:
      fallthrough
    case 0x30...0x39:
      fallthrough
    case 0x41...0x5A:
      fallthrough
    case 0x5E...0x7A:
      fallthrough
    case 0x7C:
      fallthrough
    case 0x7E:
      s.cursor += 1
      return try yy9(s)
    case 0x3B:
      s.yyt2 = s.cursor
      s.cursor += 1
      return try yy13(s)
    default:
      if s.limit <= s.cursor {
        s.state = 4
        return .waiting
      } else {
        return try yy7(s)
      }
  }
}

func yy11(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x09:
      fallthrough
    case 0x20:
      s.cursor += 1
      return try yy11(s)
    case 0x0D:
      s.cursor += 1
      return try yy12(s)
    case 0x3B:
      s.cursor += 1
      return try yy13(s)
    default:
      if s.limit <= s.cursor {
        s.state = 5
        return .waiting
      } else {
        return try yy7(s)
      }
  }
}

func yy12(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x0A:
      s.cursor += 1
      return try yy14(s)
    default:
      if s.limit <= s.cursor {
        s.state = 6
        return .waiting
      } else {
        return try yy7(s)
      }
  }
}

func yy13(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x09:
      fallthrough
    case 0x20:
      s.cursor += 1
      return try yy13(s)
    case 0x21:
      fallthrough
    case 0x23...0x27:
      fallthrough
    case 0x2A...0x2B:
      fallthrough
    case 0x2D...0x2E:
      fallthrough
    case 0x30...0x39:
      fallthrough
    case 0x41...0x5A:
      fallthrough
    case 0x5E...0x7A:
      fallthrough
    case 0x7C:
      fallthrough
    case 0x7E:
      s.yytm7 = s.add(tag: s.yytm7, value: s.cursor)
      s.cursor += 1
      return try yy15(s)
    default:
      if s.limit <= s.cursor {
        s.state = 7
        return .waiting
      } else {
        return try yy7(s)
      }
  }
}

func yy14(_ s: State) throws(ParseError) -> State.Status {
  s.l1 = s.yyt1
  s.l2 = s.yyt2
  s.p1 = s.yytm3
  s.p2 = s.yytm4
  s.p3 = s.yytm5
  s.p4 = s.yytm6
  s.state = -1
#sourceLocation(file: "codegen/swift/recursive_functions/advanced.re", line: 97)
  
    print("media type: \(s.getString(s.l1..<s.l2))")

    var pnameStart = s.p1, pnameEnd = s.p2
    var pvalStart  = s.p3, pvalEnd  = s.p4

    while pnameStart != nil {
      log("\t\(s.getString(pnameStart!.elem..<pnameEnd!.elem)) = \(s.getString(pvalStart!.elem..<pvalEnd!.elem))")
      pnameStart = pnameStart!.prev
      pnameEnd   = pnameEnd!.prev
      pvalStart  = pvalStart!.prev
      pvalEnd    = pvalEnd!.prev
    }

    return .done

#sourceLocation(file: "codegen/swift/recursive_functions/advanced.swift", line: 382)
}

func yy15(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x21:
      fallthrough
    case 0x23...0x27:
      fallthrough
    case 0x2A...0x2B:
      fallthrough
    case 0x2D...0x2E:
      fallthrough
    case 0x30...0x39:
      fallthrough
    case 0x41...0x5A:
      fallthrough
    case 0x5E...0x7A:
      fallthrough
    case 0x7C:
      fallthrough
    case 0x7E:
      s.cursor += 1
      return try yy15(s)
    case 0x3D:
      s.yytm8 = s.add(tag: s.yytm8, value: s.cursor)
      s.cursor += 1
      return try yy16(s)
    default:
      if s.limit <= s.cursor {
        s.state = 8
        return .waiting
      } else {
        return try yy7(s)
      }
  }
}

func yy16(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x21:
      fallthrough
    case 0x23...0x27:
      fallthrough
    case 0x2A...0x2B:
      fallthrough
    case 0x2D...0x2E:
      fallthrough
    case 0x30...0x39:
      fallthrough
    case 0x41...0x5A:
      fallthrough
    case 0x5E...0x7A:
      fallthrough
    case 0x7C:
      fallthrough
    case 0x7E:
      s.yytm9 = s.add(tag: s.yytm9, value: s.cursor)
      s.cursor += 1
      return try yy17(s)
    case 0x22:
      s.yytm9 = s.add(tag: s.yytm9, value: s.cursor)
      s.cursor += 1
      return try yy18(s)
    default:
      if s.limit <= s.cursor {
        s.state = 9
        return .waiting
      } else {
        return try yy7(s)
      }
  }
}

func yy17(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x09:
      fallthrough
    case 0x20:
      s.yytm10 = s.add(tag: s.yytm10, value: s.cursor)
      s.cursor += 1
      return try yy19(s)
    case 0x0D:
      s.yytm3 = s.yytm7
      s.yytm4 = s.yytm8
      s.yytm5 = s.yytm9
      s.yytm6 = s.yytm10
      s.yytm6 = s.add(tag: s.yytm6, value: s.cursor)
      s.cursor += 1
      return try yy12(s)
    case 0x21:
      fallthrough
    case 0x23...0x27:
      fallthrough
    case 0x2A...0x2B:
      fallthrough
    case 0x2D...0x2E:
      fallthrough
    case 0x30...0x39:
      fallthrough
    case 0x41...0x5A:
      fallthrough
    case 0x5E...0x7A:
      fallthrough
    case 0x7C:
      fallthrough
    case 0x7E:
      s.cursor += 1
      return try yy17(s)
    case 0x3B:
      s.yytm10 = s.add(tag: s.yytm10, value: s.cursor)
      s.cursor += 1
      return try yy13(s)
    default:
      if s.limit <= s.cursor {
        s.state = 10
        return .waiting
      } else {
        return try yy7(s)
      }
  }
}

func yy18(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x00:
      fallthrough
    case 0x01...0x08:
      fallthrough
    case 0x0A...0x1F:
      fallthrough
    case 0x7F:
      if s.limit <= s.cursor {
        s.state = 11
        return .waiting
      } else {
        return try yy7(s)
      }
    case 0x22:
      s.cursor += 1
      return try yy20(s)
    case 0x5C:
      s.cursor += 1
      return try yy21(s)
    default:
      s.cursor += 1
      return try yy18(s)
  }
}

func yy19(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x09:
      fallthrough
    case 0x20:
      s.cursor += 1
      return try yy19(s)
    case 0x0D:
      s.yytm3 = s.yytm7
      s.yytm4 = s.yytm8
      s.yytm5 = s.yytm9
      s.yytm6 = s.yytm10
      s.cursor += 1
      return try yy12(s)
    case 0x3B:
      s.cursor += 1
      return try yy13(s)
    default:
      if s.limit <= s.cursor {
        s.state = 12
        return .waiting
      } else {
        return try yy7(s)
      }
  }
}

func yy20(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x09:
      fallthrough
    case 0x20:
      s.yytm10 = s.add(tag: s.yytm10, value: s.cursor)
      s.cursor += 1
      return try yy19(s)
    case 0x0D:
      s.yytm3 = s.yytm7
      s.yytm4 = s.yytm8
      s.yytm5 = s.yytm9
      s.yytm6 = s.yytm10
      s.yytm6 = s.add(tag: s.yytm6, value: s.cursor)
      s.cursor += 1
      return try yy12(s)
    case 0x3B:
      s.yytm10 = s.add(tag: s.yytm10, value: s.cursor)
      s.cursor += 1
      return try yy13(s)
    default:
      if s.limit <= s.cursor {
        s.state = 13
        return .waiting
      } else {
        return try yy7(s)
      }
  }
}

func yy21(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x00:
      fallthrough
    case 0x01...0x08:
      fallthrough
    case 0x0A...0x1E:
      fallthrough
    case 0x7F:
      if s.limit <= s.cursor {
        s.state = 14
        return .waiting
      } else {
        return try yy7(s)
      }
    default:
      s.cursor += 1
      return try yy18(s)
  }
}

func yy22(_ s: State) throws(ParseError) -> State.Status {
  s.state = -1
#sourceLocation(file: "codegen/swift/recursive_functions/advanced.re", line: 125)
  return .end
#sourceLocation(file: "codegen/swift/recursive_functions/advanced.swift", line: 621)
}

func yyfnmedia_type(_ s: State) throws(ParseError) -> State.Status {
  return try yy1(s)
}

func yy23(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x00:
      fallthrough
    case 0x01...0x0C:
      fallthrough
    case 0x0E...0x1E:
      fallthrough
    case 0x7F:
      if s.limit <= s.cursor {
        s.state = 15
        return .waiting
      } else {
        s.cursor += 1
        return try yy24(s)
      }
    case 0x0D:
      s.yytm1 = s.add(tag: s.yytm1, value: s.cursor)
      s.cursor += 1
      return try yy26(s)
    default:
      s.cursor += 1
      return try yy27(s)
  }
}

func yy24(_ s: State) throws(ParseError) -> State.Status {
  return try yy25(s)
}

func yy25(_ s: State) throws(ParseError) -> State.Status {
  s.state = -1
#sourceLocation(file: "codegen/swift/recursive_functions/advanced.re", line: 126)
  throw .unexpectedCharacter
#sourceLocation(file: "codegen/swift/recursive_functions/advanced.swift", line: 663)
}

func yy26(_ s: State) throws(ParseError) -> State.Status {
  s.accept = 0
  s.marker = s.cursor
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x0A:
      s.cursor += 1
      return try yy28(s)
    default:
      if s.limit <= s.cursor {
        s.state = 16
        return .waiting
      } else {
        return try yy25(s)
      }
  }
}

func yy27(_ s: State) throws(ParseError) -> State.Status {
  s.accept = 0
  s.marker = s.cursor
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x00:
      fallthrough
    case 0x01...0x08:
      fallthrough
    case 0x0A...0x0C:
      fallthrough
    case 0x0E...0x1E:
      fallthrough
    case 0x7F:
      if s.limit <= s.cursor {
        s.state = 17
        return .waiting
      } else {
        return try yy25(s)
      }
    case 0x09:
      s.cursor += 1
      return try yy30(s)
    case 0x0D:
      s.yytm1 = s.add(tag: s.yytm1, value: s.cursor)
      s.cursor += 1
      return try yy31(s)
    default:
      s.cursor += 1
      return try yy32(s)
  }
}

func yy28(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x09:
      fallthrough
    case 0x20:
      s.cursor += 1
      return try yy33(s)
    default:
      if s.limit <= s.cursor {
        s.state = 18
        return .waiting
      } else {
        return try yy29(s)
      }
  }
}

func yy29(_ s: State) throws(ParseError) -> State.Status {
  s.cursor = s.marker
  if s.accept == 0 {
    return try yy25(s)
  } else {
    return try yy38(s)
  }
}

func yy30(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x00:
      fallthrough
    case 0x01...0x08:
      fallthrough
    case 0x0A...0x1E:
      fallthrough
    case 0x7F:
      if s.limit <= s.cursor {
        s.state = 19
        return .waiting
      } else {
        return try yy29(s)
      }
    case 0x09:
      s.cursor += 1
      return try yy30(s)
    case 0x20:
      s.cursor += 1
      return try yy32(s)
    default:
      s.cursor += 1
      return try yy34(s)
  }
}

func yy31(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x0A:
      s.cursor += 1
      return try yy28(s)
    default:
      if s.limit <= s.cursor {
        s.state = 20
        return .waiting
      } else {
        return try yy29(s)
      }
  }
}

func yy32(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x00:
      fallthrough
    case 0x01...0x08:
      fallthrough
    case 0x0A...0x0C:
      fallthrough
    case 0x0E...0x1E:
      fallthrough
    case 0x7F:
      if s.limit <= s.cursor {
        s.state = 21
        return .waiting
      } else {
        return try yy29(s)
      }
    case 0x09:
      s.cursor += 1
      return try yy30(s)
    case 0x0D:
      s.yytm1 = s.add(tag: s.yytm1, value: s.cursor)
      s.cursor += 1
      return try yy31(s)
    default:
      s.cursor += 1
      return try yy32(s)
  }
}

func yy33(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x00:
      fallthrough
    case 0x01...0x08:
      fallthrough
    case 0x0A...0x0C:
      fallthrough
    case 0x0E...0x1E:
      fallthrough
    case 0x7F:
      if s.limit <= s.cursor {
        s.state = 22
        return .waiting
      } else {
        return try yy29(s)
      }
    case 0x09:
      fallthrough
    case 0x20:
      s.cursor += 1
      return try yy33(s)
    case 0x0D:
      s.yytm3 = s.add(tag: s.yytm3, value: s.cursor)
      s.yytm2 = s.yytm1
      s.yytm2 = s.add(tag: s.yytm2, value: s.cursor)
      s.cursor += 1
      return try yy35(s)
    default:
      s.yytm3 = s.add(tag: s.yytm3, value: s.cursor)
      s.cursor += 1
      return try yy36(s)
  }
}

func yy34(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x00:
      fallthrough
    case 0x01...0x0C:
      fallthrough
    case 0x0E...0x1E:
      fallthrough
    case 0x7F:
      if s.limit <= s.cursor {
        s.state = 23
        return .waiting
      } else {
        return try yy29(s)
      }
    case 0x0D:
      s.yytm1 = s.add(tag: s.yytm1, value: s.cursor)
      s.cursor += 1
      return try yy31(s)
    default:
      s.cursor += 1
      return try yy32(s)
  }
}

func yy35(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x0A:
      s.cursor += 1
      return try yy37(s)
    default:
      if s.limit <= s.cursor {
        s.state = 24
        return .waiting
      } else {
        return try yy29(s)
      }
  }
}

func yy36(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x00:
      fallthrough
    case 0x01...0x08:
      fallthrough
    case 0x0A...0x0C:
      fallthrough
    case 0x0E...0x1E:
      fallthrough
    case 0x7F:
      if s.limit <= s.cursor {
        s.state = 25
        return .waiting
      } else {
        return try yy29(s)
      }
    case 0x09:
      s.cursor += 1
      return try yy39(s)
    case 0x0D:
      s.yytm2 = s.yytm1
      s.yytm2 = s.add(tag: s.yytm2, value: s.cursor)
      s.cursor += 1
      return try yy35(s)
    default:
      s.cursor += 1
      return try yy36(s)
  }
}

func yy37(_ s: State) throws(ParseError) -> State.Status {
  s.accept = 1
  s.marker = s.cursor
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x09:
      fallthrough
    case 0x20:
      s.yytm1 = s.yytm2
      s.cursor += 1
      return try yy33(s)
    default:
      if s.limit <= s.cursor {
        s.state = 26
        return .waiting
      } else {
        return try yy38(s)
      }
  }
}

func yy38(_ s: State) throws(ParseError) -> State.Status {
  s.f1 = s.yytm1
  s.f2 = s.yytm3
  s.state = -1
#sourceLocation(file: "codegen/swift/recursive_functions/advanced.re", line: 114)
  
    var foldStart = s.f1, foldEnd = s.f2
    while foldStart != nil {
      log("\t\(s.getString(foldStart!.elem..<foldEnd!.elem))")
      foldStart = foldStart!.prev
      foldEnd   = foldEnd!.prev
    }

    return .done

#sourceLocation(file: "codegen/swift/recursive_functions/advanced.swift", line: 965)
}

func yy39(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x00:
      fallthrough
    case 0x01...0x08:
      fallthrough
    case 0x0A...0x0C:
      fallthrough
    case 0x0E...0x1E:
      fallthrough
    case 0x7F:
      if s.limit <= s.cursor {
        s.state = 27
        return .waiting
      } else {
        return try yy29(s)
      }
    case 0x09:
      s.cursor += 1
      return try yy39(s)
    case 0x0D:
      s.cursor += 1
      return try yy40(s)
    case 0x20:
      s.cursor += 1
      return try yy36(s)
    default:
      s.cursor += 1
      return try yy41(s)
  }
}

func yy40(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x0A:
      s.cursor += 1
      return try yy42(s)
    default:
      if s.limit <= s.cursor {
        s.state = 28
        return .waiting
      } else {
        return try yy29(s)
      }
  }
}

func yy41(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x00:
      fallthrough
    case 0x01...0x08:
      fallthrough
    case 0x0A...0x0C:
      fallthrough
    case 0x0E...0x1E:
      fallthrough
    case 0x7F:
      if s.limit <= s.cursor {
        s.state = 29
        return .waiting
      } else {
        return try yy29(s)
      }
    case 0x09:
      s.cursor += 1
      return try yy43(s)
    case 0x0D:
      s.yytm2 = s.yytm1
      s.yytm2 = s.add(tag: s.yytm2, value: s.cursor)
      s.cursor += 1
      return try yy35(s)
    default:
      s.cursor += 1
      return try yy36(s)
  }
}

func yy42(_ s: State) throws(ParseError) -> State.Status {
  return try yy38(s)
}

func yy43(_ s: State) throws(ParseError) -> State.Status {
  let yych = s.buffer[s.cursor]
  switch yych {
    case 0x09:
      fallthrough
    case 0x20:
      s.cursor += 1
      return try yy43(s)
    case 0x0D:
      s.cursor += 1
      return try yy40(s)
    default:
      if s.limit <= s.cursor {
        s.state = 30
        return .waiting
      } else {
        return try yy29(s)
      }
  }
}

func yy44(_ s: State) throws(ParseError) -> State.Status {
  s.state = -1
#sourceLocation(file: "codegen/swift/recursive_functions/advanced.re", line: 125)
  return .end
#sourceLocation(file: "codegen/swift/recursive_functions/advanced.swift", line: 1078)
}

func yyfnheader(_ s: State) throws(ParseError) -> State.Status {
  return try yy23(s)
}

func yy0(_ s: State) throws(ParseError) -> State.Status {
  switch s.cond {
    case yycmedia_type: return try yyfnmedia_type(s)
    case yycheader: return try yyfnheader(s)
    default: fatalError("internal lexer error")
  }
}

func parse(_ s: State) throws(ParseError) -> State.Status {
  switch s.state {
    case -1: return try yy0(s)
    case 0:
      if s.limit <= s.cursor {
        return try yy22(s)
      } else {
        return try yy1(s)
      }
    case 1:
      if s.limit <= s.cursor {
        return try yy3(s)
      } else {
        return try yy4(s)
      }
    case 2:
      if s.limit <= s.cursor {
        return try yy7(s)
      } else {
        return try yy5(s)
      }
    case 3:
      if s.limit <= s.cursor {
        return try yy7(s)
      } else {
        return try yy8(s)
      }
    case 4:
      if s.limit <= s.cursor {
        return try yy7(s)
      } else {
        return try yy9(s)
      }
    case 5:
      if s.limit <= s.cursor {
        return try yy7(s)
      } else {
        return try yy11(s)
      }
    case 6:
      if s.limit <= s.cursor {
        return try yy7(s)
      } else {
        return try yy12(s)
      }
    case 7:
      if s.limit <= s.cursor {
        return try yy7(s)
      } else {
        return try yy13(s)
      }
    case 8:
      if s.limit <= s.cursor {
        return try yy7(s)
      } else {
        return try yy15(s)
      }
    case 9:
      if s.limit <= s.cursor {
        return try yy7(s)
      } else {
        return try yy16(s)
      }
    case 10:
      if s.limit <= s.cursor {
        return try yy7(s)
      } else {
        return try yy17(s)
      }
    case 11:
      if s.limit <= s.cursor {
        return try yy7(s)
      } else {
        return try yy18(s)
      }
    case 12:
      if s.limit <= s.cursor {
        return try yy7(s)
      } else {
        return try yy19(s)
      }
    case 13:
      if s.limit <= s.cursor {
        return try yy7(s)
      } else {
        return try yy20(s)
      }
    case 14:
      if s.limit <= s.cursor {
        return try yy7(s)
      } else {
        return try yy21(s)
      }
    case 15:
      if s.limit <= s.cursor {
        return try yy44(s)
      } else {
        return try yy23(s)
      }
    case 16:
      if s.limit <= s.cursor {
        return try yy25(s)
      } else {
        return try yy26(s)
      }
    case 17:
      if s.limit <= s.cursor {
        return try yy25(s)
      } else {
        return try yy27(s)
      }
    case 18:
      if s.limit <= s.cursor {
        return try yy29(s)
      } else {
        return try yy28(s)
      }
    case 19:
      if s.limit <= s.cursor {
        return try yy29(s)
      } else {
        return try yy30(s)
      }
    case 20:
      if s.limit <= s.cursor {
        return try yy29(s)
      } else {
        return try yy31(s)
      }
    case 21:
      if s.limit <= s.cursor {
        return try yy29(s)
      } else {
        return try yy32(s)
      }
    case 22:
      if s.limit <= s.cursor {
        return try yy29(s)
      } else {
        return try yy33(s)
      }
    case 23:
      if s.limit <= s.cursor {
        return try yy29(s)
      } else {
        return try yy34(s)
      }
    case 24:
      if s.limit <= s.cursor {
        return try yy29(s)
      } else {
        return try yy35(s)
      }
    case 25:
      if s.limit <= s.cursor {
        return try yy29(s)
      } else {
        return try yy36(s)
      }
    case 26:
      if s.limit <= s.cursor {
        return try yy38(s)
      } else {
        return try yy37(s)
      }
    case 27:
      if s.limit <= s.cursor {
        return try yy29(s)
      } else {
        return try yy39(s)
      }
    case 28:
      if s.limit <= s.cursor {
        return try yy29(s)
      } else {
        return try yy40(s)
      }
    case 29:
      if s.limit <= s.cursor {
        return try yy29(s)
      } else {
        return try yy41(s)
      }
    case 30:
      if s.limit <= s.cursor {
        return try yy29(s)
      } else {
        return try yy43(s)
      }
    default: fatalError("internal lexer error")
  }
}

#sourceLocation(file: "codegen/swift/recursive_functions/advanced.re", line: 127)


extension State {
  // Feed the next data packet into the buffer
  func feed(string: StaticString) throws(ParseError) {
    let shift = self.token
    let free = bufferSize - (self.limit - shift)

    // Error: no free space, in the real world we can reallocate a larger buffer.
    if (free < string.utf8CodeUnitCount) {
      throw .bigPacket(string.utf8CodeUnitCount, free)
    }

    string.withUTF8Buffer { chunk in
      if (shift > 0) {
        // Shift buffer contents, discarding already processed data.
        self.buffer.replaceSubrange(..<(bufferSize - shift), with: self.buffer[shift..<bufferSize])
        self.limit  -= shift
        self.cursor -= shift
        self.marker -= shift
        self.token = 0
        
#sourceLocation(file: "codegen/swift/recursive_functions/advanced.swift", line: 1309)
        if self.yyt1 != tagNone { self.yyt1 -= shift }
        if self.yyt2 != tagNone { self.yyt2 -= shift }
#sourceLocation(file: "codegen/swift/recursive_functions/advanced.re", line: 148)

      }

      // Fill remaining space with new data.
      self.buffer.replaceSubrange(self.limit..<(self.limit + chunk.count), with: chunk)
      self.limit += chunk.count
    }
  }

  // Append a single value to an m-tag history.
  func add(tag prevTag: MTag?, value: Int) -> MTag {
    let tag = MTag(prev: prevTag, element: value)
    self.mTagPool.append(tag)
    return tag
  }

  // Decode a string from a slice of the buffer.
  func getString(_ range: Range<Int>) -> String {
    String(data: Data(self.buffer[range]), encoding: .utf8)!
  }

  enum Status {
    case waiting, done, end
  }
}

enum ParseError: Error {
  case unexpectedCharacter
  case bigPacket(Int, Int)
}

extension ParseError: LocalizedError {
  public var errorDescription: String? {
    switch self {
      case .unexpectedCharacter: "Malformed stream"
      case .bigPacket(let size, let free): "Token (\(size) bytes) too long for receive buffer (\(free) free)"
    }
  }
}

// An m-tag tree is a way to store histories with an O(1) copy operation.
// Histories naturally form a tree, as they have a common start and fork
// at some point. The tree is stored as an array of pairs (tag value,
// link to parent). An m-tag is represented with a single index in the tree.
class MTag {
  weak var prev: MTag?
  var elem: Int

  init(prev: MTag?, element: Int) {
    self.prev = prev
    self.elem = element
  }
}

func test(packets: [StaticString]) -> Int32 {
  let c = State()

  // Main loop. The buffer contains incomplete data which appears packet by
  // packet. When the lexer needs more input it saves its internal state and
  // returns to the caller which should provide more input and resume lexing.
  var chunkIdx = 0
  do {
    finally: while true {
      switch try parse(c) {
        case .waiting:
          print("waiting")
          try c.feed(string: packets[chunkIdx])
          chunkIdx += 1
        case .done:
          print("done")
        case .end:
          print("end")
          break finally
      }
    }
    return 0
  } catch {
    log("Parse error:", error.localizedDescription)
    return 1
  }
}

@main struct Program {
  static func main() {
    let packets: [StaticString] = [
      "ap",
      "plication/j",
      "son;",
      " charset=\"",
      "utf\\\"-8\"\r",
      "\n",
      ""
    ];

    let code = test(packets: packets)
    if code != 0 {
      log("Error exit:", code)
    }
    exit(code)
  }
}
codegen/swift/recursive_functions/advanced.re:97:35: warning: tag `p1` in condition 'media_type' has 2nd degree of nondeterminism [-Wnondeterministic-tags]
codegen/swift/recursive_functions/advanced.re:97:35: warning: tag `p2` in condition 'media_type' has 2nd degree of nondeterminism [-Wnondeterministic-tags]
codegen/swift/recursive_functions/advanced.re:97:35: warning: tag `p3` in condition 'media_type' has 2nd degree of nondeterminism [-Wnondeterministic-tags]
codegen/swift/recursive_functions/advanced.re:97:35: warning: tag `p4` in condition 'media_type' has 2nd degree of nondeterminism [-Wnondeterministic-tags]
codegen/swift/recursive_functions/advanced.re:114:36: warning: tag `f1` in condition 'header' has 2nd degree of nondeterminism [-Wnondeterministic-tags]
codegen/swift/recursive_functions/advanced.re:114:36: warning: tag `f2` in condition 'header' has 3rd degree of nondeterminism [-Wnondeterministic-tags]
