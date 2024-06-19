// Code generated by re2c, DO NOT EDIT.
//line "codegen/go/recursive_functions/advanced.re":1
//go:generate re2go $INPUT -o $OUTPUT -cf --recursive-functions -Wno-nondeterministic-tags
package main

import (
	"fmt"
	"os"
)

//line "codegen/go/recursive_functions/advanced.go":12
const (
	yycmedia_type = 1
	yycheader = 23
)
//line "codegen/go/recursive_functions/advanced.re":9


const debug bool = false

// Intentionally small to trigger buffer refill.
const SIZE int = 4095

const (
	mtagRoot int = -1
	tagNone int = -1
)

// An m-tag tree is a way to store histories with an O(1) copy operation.
// Histories naturally form a tree, as they have common start and fork at some
// point. The tree is stored as an array of pairs (tag value, link to parent).
// An m-tag is represented with a single link in the tree (array index).
type mtagElem struct {
	elem int
	pred int
}
type mtagTrie = []mtagElem

// Append a single value to an m-tag history.
func add_mtag(trie *mtagTrie, mtag int, value int) int {
	*trie = append(*trie, mtagElem{value, mtag})
	return len(*trie) - 1
}

// Recursively unwind tag histories and collect version components.
func unwind(trie mtagTrie, x int, y int, str []byte) []string {
	// Reached the root of the m-tag tree, stop recursion.
	if x == mtagRoot && y == mtagRoot {
		return []string{}
	}

	// Unwind history further.
	result := unwind(trie, trie[x].pred, trie[y].pred, str)

	// Get tag values. Tag histories must have equal length.
	if x == mtagRoot || y == mtagRoot {
		panic("tag histories have different length")
	}
	ex := trie[x].elem
	ey := trie[y].elem

	if ex != tagNone && ey != tagNone {
		// Both tags are valid string indices, extract component.
		result = append(result, string(str[ex:ey]))
	} else if !(ex == tagNone && ey == tagNone) {
		panic("both tags should be tagNone")
	}
	return result
}

type State struct {
	file     *os.File
	str      []byte
	cur      int
	mar      int
	tok      int
	lim      int
	yycond   int
	yystate  int
	trie     mtagTrie
	
//line "codegen/go/recursive_functions/advanced.go":83

	yyt1 int
	yyt2 int
//line "codegen/go/recursive_functions/advanced.re":73

	
//line "codegen/go/recursive_functions/advanced.go":90

	yytm1 int
	yytm10 int
	yytm2 int
	yytm3 int
	yytm4 int
	yytm5 int
	yytm6 int
	yytm7 int
	yytm8 int
	yytm9 int
//line "codegen/go/recursive_functions/advanced.re":74

	l1, l2   int
	f1, f2   int
	p1, p2   int
	p3, p4   int
	yyaccept int
}

const (
	lexEnd = iota
	lexReady
	lexWaiting
	lexBadPacket
	lexBigPacket
)

func fill(st *State) int {
	shift := st.tok
	used := st.lim - st.tok
	free := SIZE - used

	// Error: no space. In real life can reallocate a larger buffer.
	if free < 1 { return lexBigPacket }

	// Shift buffer contents (discard already processed data).
	copy(st.str[0:], st.str[shift:shift+used])
	st.cur -= shift
	st.mar -= shift
	st.lim -= shift
	st.tok -= shift
	
//line "codegen/go/recursive_functions/advanced.go":134

	st.yyt1 -= shift
	st.yyt2 -= shift
//line "codegen/go/recursive_functions/advanced.re":104


	// Fill free space at the end of buffer with new data.
	n, _ := st.file.Read(st.str[st.lim:SIZE])
	st.lim += n
	st.str[st.lim] = 0 // append sentinel symbol

	return lexReady
}


//line "codegen/go/recursive_functions/advanced.go":150
func yy1(st *State) int {
	yych := st.str[st.cur]
	switch (yych) {
	case '!':
		fallthrough
	case '#','$','%','&','\'':
		fallthrough
	case '*','+':
		fallthrough
	case '-','.':
		fallthrough
	case '0','1','2','3','4','5','6','7','8','9':
		fallthrough
	case 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z':
		fallthrough
	case '^','_','`','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z':
		fallthrough
	case '|':
		fallthrough
	case '~':
		st.yyt1 = st.cur
		st.cur += 1
		return yy4(st)
	default:
		if (st.lim <= st.cur) {
			st.yystate = 0
			return lexWaiting
		} else {
			st.cur += 1
			return yy2(st)
		}
	}
}

func yy2(st *State) int {
	return yy3(st)
}

func yy3(st *State) int {
	st.yystate = -1
//line "codegen/go/recursive_functions/advanced.re":174
	return lexBadPacket
//line "codegen/go/recursive_functions/advanced.go":193
}

func yy4(st *State) int {
	st.mar = st.cur
	yych := st.str[st.cur]
	switch (yych) {
	case '!':
		fallthrough
	case '#','$','%','&','\'':
		fallthrough
	case '*','+':
		fallthrough
	case '-','.','/','0','1','2','3','4','5','6','7','8','9':
		fallthrough
	case 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z':
		fallthrough
	case '^','_','`','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z':
		fallthrough
	case '|':
		fallthrough
	case '~':
		return yy6(st, yych)
	default:
		if (st.lim <= st.cur) {
			st.yystate = 1
			return lexWaiting
		} else {
			return yy3(st)
		}
	}
}

func yy5(st *State) int {
	yych := st.str[st.cur]
	return yy6(st, yych)
}

func yy6(st *State, yych byte) int {
	switch (yych) {
	case '!':
		fallthrough
	case '#','$','%','&','\'':
		fallthrough
	case '*','+':
		fallthrough
	case '-','.':
		fallthrough
	case '0','1','2','3','4','5','6','7','8','9':
		fallthrough
	case 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z':
		fallthrough
	case '^','_','`','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z':
		fallthrough
	case '|':
		fallthrough
	case '~':
		st.cur += 1
		return yy5(st)
	case '/':
		st.cur += 1
		return yy8(st)
	default:
		if (st.lim <= st.cur) {
			st.yystate = 2
			return lexWaiting
		} else {
			return yy7(st)
		}
	}
}

func yy7(st *State) int {
	st.cur = st.mar
	return yy3(st)
}

func yy8(st *State) int {
	yych := st.str[st.cur]
	switch (yych) {
	case 0x00:
		fallthrough
	case '\t':
		fallthrough
	case '\r':
		fallthrough
	case ' ':
		fallthrough
	case ';':
		if (st.lim <= st.cur) {
			st.yystate = 3
			return lexWaiting
		} else {
			return yy7(st)
		}
	default:
		return yy10(st, yych)
	}
}

func yy9(st *State) int {
	yych := st.str[st.cur]
	return yy10(st, yych)
}

func yy10(st *State, yych byte) int {
	switch (yych) {
	case '\t':
		fallthrough
	case ' ':
		st.yytm6 = st.yytm10
		st.yytm6 = add_mtag(&st.trie, st.yytm6, tagNone)
		st.yytm5 = st.yytm9
		st.yytm5 = add_mtag(&st.trie, st.yytm5, tagNone)
		st.yytm4 = st.yytm8
		st.yytm4 = add_mtag(&st.trie, st.yytm4, tagNone)
		st.yytm3 = st.yytm7
		st.yytm3 = add_mtag(&st.trie, st.yytm3, tagNone)
		st.yyt2 = st.cur
		st.cur += 1
		return yy11(st)
	case '\r':
		st.yytm6 = st.yytm10
		st.yytm6 = add_mtag(&st.trie, st.yytm6, tagNone)
		st.yytm5 = st.yytm9
		st.yytm5 = add_mtag(&st.trie, st.yytm5, tagNone)
		st.yytm4 = st.yytm8
		st.yytm4 = add_mtag(&st.trie, st.yytm4, tagNone)
		st.yytm3 = st.yytm7
		st.yytm3 = add_mtag(&st.trie, st.yytm3, tagNone)
		st.yyt2 = st.cur
		st.cur += 1
		return yy12(st)
	case '!':
		fallthrough
	case '#','$','%','&','\'':
		fallthrough
	case '*','+':
		fallthrough
	case '-','.':
		fallthrough
	case '0','1','2','3','4','5','6','7','8','9':
		fallthrough
	case 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z':
		fallthrough
	case '^','_','`','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z':
		fallthrough
	case '|':
		fallthrough
	case '~':
		st.cur += 1
		return yy9(st)
	case ';':
		st.yyt2 = st.cur
		st.cur += 1
		return yy13(st)
	default:
		if (st.lim <= st.cur) {
			st.yystate = 4
			return lexWaiting
		} else {
			return yy7(st)
		}
	}
}

func yy11(st *State) int {
	yych := st.str[st.cur]
	switch (yych) {
	case '\t':
		fallthrough
	case ' ':
		st.cur += 1
		return yy11(st)
	case '\r':
		st.cur += 1
		return yy12(st)
	case ';':
		st.cur += 1
		return yy13(st)
	default:
		if (st.lim <= st.cur) {
			st.yystate = 5
			return lexWaiting
		} else {
			return yy7(st)
		}
	}
}

func yy12(st *State) int {
	yych := st.str[st.cur]
	switch (yych) {
	case '\n':
		st.cur += 1
		return yy14(st)
	default:
		if (st.lim <= st.cur) {
			st.yystate = 6
			return lexWaiting
		} else {
			return yy7(st)
		}
	}
}

func yy13(st *State) int {
	yych := st.str[st.cur]
	switch (yych) {
	case '\t':
		fallthrough
	case ' ':
		st.cur += 1
		return yy13(st)
	case '!':
		fallthrough
	case '#','$','%','&','\'':
		fallthrough
	case '*','+':
		fallthrough
	case '-','.':
		fallthrough
	case '0','1','2','3','4','5','6','7','8','9':
		fallthrough
	case 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z':
		fallthrough
	case '^','_','`','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z':
		fallthrough
	case '|':
		fallthrough
	case '~':
		st.yytm7 = add_mtag(&st.trie, st.yytm7, st.cur)
		st.cur += 1
		return yy15(st)
	default:
		if (st.lim <= st.cur) {
			st.yystate = 7
			return lexWaiting
		} else {
			return yy7(st)
		}
	}
}

func yy14(st *State) int {
	st.l1 = st.yyt1
	st.l2 = st.yyt2
	st.p1 = st.yytm3
	st.p2 = st.yytm4
	st.p3 = st.yytm5
	st.p4 = st.yytm6
	st.yystate = -1
//line "codegen/go/recursive_functions/advanced.re":152
	
		if debug {fmt.Printf("media type: %v\n", string(st.str[st.l1:st.l2]))}

		pnames := unwind(st.trie, st.p1, st.p2, st.str)
		if debug {fmt.Printf("pnames: %v\n", pnames)}

		pvals := unwind(st.trie, st.p3, st.p4, st.str)
		if debug {fmt.Printf("pvals: %v\n", pvals)}

		st.tok = st.cur
		return lex(st)

//line "codegen/go/recursive_functions/advanced.go":458
}

func yy15(st *State) int {
	yych := st.str[st.cur]
	switch (yych) {
	case '!':
		fallthrough
	case '#','$','%','&','\'':
		fallthrough
	case '*','+':
		fallthrough
	case '-','.':
		fallthrough
	case '0','1','2','3','4','5','6','7','8','9':
		fallthrough
	case 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z':
		fallthrough
	case '^','_','`','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z':
		fallthrough
	case '|':
		fallthrough
	case '~':
		st.cur += 1
		return yy15(st)
	case '=':
		st.yytm8 = add_mtag(&st.trie, st.yytm8, st.cur)
		st.cur += 1
		return yy16(st)
	default:
		if (st.lim <= st.cur) {
			st.yystate = 8
			return lexWaiting
		} else {
			return yy7(st)
		}
	}
}

func yy16(st *State) int {
	yych := st.str[st.cur]
	switch (yych) {
	case '!':
		fallthrough
	case '#','$','%','&','\'':
		fallthrough
	case '*','+':
		fallthrough
	case '-','.':
		fallthrough
	case '0','1','2','3','4','5','6','7','8','9':
		fallthrough
	case 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z':
		fallthrough
	case '^','_','`','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z':
		fallthrough
	case '|':
		fallthrough
	case '~':
		st.yytm9 = add_mtag(&st.trie, st.yytm9, st.cur)
		st.cur += 1
		return yy17(st)
	case '"':
		st.yytm9 = add_mtag(&st.trie, st.yytm9, st.cur)
		st.cur += 1
		return yy18(st)
	default:
		if (st.lim <= st.cur) {
			st.yystate = 9
			return lexWaiting
		} else {
			return yy7(st)
		}
	}
}

func yy17(st *State) int {
	yych := st.str[st.cur]
	switch (yych) {
	case '\t':
		fallthrough
	case ' ':
		st.yytm10 = add_mtag(&st.trie, st.yytm10, st.cur)
		st.cur += 1
		return yy19(st)
	case '\r':
		st.yytm3 = st.yytm7
		st.yytm4 = st.yytm8
		st.yytm5 = st.yytm9
		st.yytm6 = st.yytm10
		st.yytm6 = add_mtag(&st.trie, st.yytm6, st.cur)
		st.cur += 1
		return yy12(st)
	case '!':
		fallthrough
	case '#','$','%','&','\'':
		fallthrough
	case '*','+':
		fallthrough
	case '-','.':
		fallthrough
	case '0','1','2','3','4','5','6','7','8','9':
		fallthrough
	case 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z':
		fallthrough
	case '^','_','`','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z':
		fallthrough
	case '|':
		fallthrough
	case '~':
		st.cur += 1
		return yy17(st)
	case ';':
		st.yytm10 = add_mtag(&st.trie, st.yytm10, st.cur)
		st.cur += 1
		return yy13(st)
	default:
		if (st.lim <= st.cur) {
			st.yystate = 10
			return lexWaiting
		} else {
			return yy7(st)
		}
	}
}

func yy18(st *State) int {
	yych := st.str[st.cur]
	switch (yych) {
	case 0x00:
		fallthrough
	case 0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08:
		fallthrough
	case '\n','\v','\f','\r',0x0E,0x0F,0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17,0x18,0x19,0x1A,0x1B,0x1C,0x1D,0x1E,0x1F:
		fallthrough
	case 0x7F:
		if (st.lim <= st.cur) {
			st.yystate = 11
			return lexWaiting
		} else {
			return yy7(st)
		}
	case '"':
		st.cur += 1
		return yy20(st)
	case '\\':
		st.cur += 1
		return yy21(st)
	default:
		st.cur += 1
		return yy18(st)
	}
}

func yy19(st *State) int {
	yych := st.str[st.cur]
	switch (yych) {
	case '\t':
		fallthrough
	case ' ':
		st.cur += 1
		return yy19(st)
	case '\r':
		st.yytm3 = st.yytm7
		st.yytm4 = st.yytm8
		st.yytm5 = st.yytm9
		st.yytm6 = st.yytm10
		st.cur += 1
		return yy12(st)
	case ';':
		st.cur += 1
		return yy13(st)
	default:
		if (st.lim <= st.cur) {
			st.yystate = 12
			return lexWaiting
		} else {
			return yy7(st)
		}
	}
}

func yy20(st *State) int {
	yych := st.str[st.cur]
	switch (yych) {
	case '\t':
		fallthrough
	case ' ':
		st.yytm10 = add_mtag(&st.trie, st.yytm10, st.cur)
		st.cur += 1
		return yy19(st)
	case '\r':
		st.yytm3 = st.yytm7
		st.yytm4 = st.yytm8
		st.yytm5 = st.yytm9
		st.yytm6 = st.yytm10
		st.yytm6 = add_mtag(&st.trie, st.yytm6, st.cur)
		st.cur += 1
		return yy12(st)
	case ';':
		st.yytm10 = add_mtag(&st.trie, st.yytm10, st.cur)
		st.cur += 1
		return yy13(st)
	default:
		if (st.lim <= st.cur) {
			st.yystate = 13
			return lexWaiting
		} else {
			return yy7(st)
		}
	}
}

func yy21(st *State) int {
	yych := st.str[st.cur]
	switch (yych) {
	case 0x00:
		fallthrough
	case 0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08:
		fallthrough
	case '\n','\v','\f','\r',0x0E,0x0F,0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17,0x18,0x19,0x1A,0x1B,0x1C,0x1D,0x1E:
		fallthrough
	case 0x7F:
		if (st.lim <= st.cur) {
			st.yystate = 14
			return lexWaiting
		} else {
			return yy7(st)
		}
	default:
		st.cur += 1
		return yy18(st)
	}
}

func yy22(st *State) int {
	st.yystate = -1
//line "codegen/go/recursive_functions/advanced.re":173
	return lexEnd
//line "codegen/go/recursive_functions/advanced.go":697
}

func yyfnmedia_type(st *State) int {
	return yy1(st)
}

func yy23(st *State) int {
	yych := st.str[st.cur]
	switch (yych) {
	case 0x00:
		fallthrough
	case 0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,'\t','\n','\v','\f':
		fallthrough
	case 0x0E,0x0F,0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17,0x18,0x19,0x1A,0x1B,0x1C,0x1D,0x1E:
		fallthrough
	case 0x7F:
		if (st.lim <= st.cur) {
			st.yystate = 15
			return lexWaiting
		} else {
			st.cur += 1
			return yy24(st)
		}
	case '\r':
		st.yytm1 = add_mtag(&st.trie, st.yytm1, st.cur)
		st.cur += 1
		return yy26(st)
	default:
		st.cur += 1
		return yy27(st)
	}
}

func yy24(st *State) int {
	return yy25(st)
}

func yy25(st *State) int {
	st.yystate = -1
//line "codegen/go/recursive_functions/advanced.re":174
	return lexBadPacket
//line "codegen/go/recursive_functions/advanced.go":739
}

func yy26(st *State) int {
	st.yyaccept = 0
	st.mar = st.cur
	yych := st.str[st.cur]
	switch (yych) {
	case '\n':
		st.cur += 1
		return yy28(st)
	default:
		if (st.lim <= st.cur) {
			st.yystate = 16
			return lexWaiting
		} else {
			return yy25(st)
		}
	}
}

func yy27(st *State) int {
	st.yyaccept = 0
	st.mar = st.cur
	yych := st.str[st.cur]
	switch (yych) {
	case 0x00:
		fallthrough
	case 0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08:
		fallthrough
	case '\n','\v','\f':
		fallthrough
	case 0x0E,0x0F,0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17,0x18,0x19,0x1A,0x1B,0x1C,0x1D,0x1E:
		fallthrough
	case 0x7F:
		if (st.lim <= st.cur) {
			st.yystate = 17
			return lexWaiting
		} else {
			return yy25(st)
		}
	case '\t':
		st.cur += 1
		return yy30(st)
	case '\r':
		st.yytm1 = add_mtag(&st.trie, st.yytm1, st.cur)
		st.cur += 1
		return yy31(st)
	default:
		st.cur += 1
		return yy32(st)
	}
}

func yy28(st *State) int {
	yych := st.str[st.cur]
	switch (yych) {
	case '\t':
		fallthrough
	case ' ':
		st.cur += 1
		return yy33(st)
	default:
		if (st.lim <= st.cur) {
			st.yystate = 18
			return lexWaiting
		} else {
			return yy29(st)
		}
	}
}

func yy29(st *State) int {
	st.cur = st.mar
	if (st.yyaccept == 0) {
		return yy25(st)
	} else {
		return yy38(st)
	}
}

func yy30(st *State) int {
	yych := st.str[st.cur]
	switch (yych) {
	case 0x00:
		fallthrough
	case 0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08:
		fallthrough
	case '\n','\v','\f','\r',0x0E,0x0F,0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17,0x18,0x19,0x1A,0x1B,0x1C,0x1D,0x1E:
		fallthrough
	case 0x7F:
		if (st.lim <= st.cur) {
			st.yystate = 19
			return lexWaiting
		} else {
			return yy29(st)
		}
	case '\t':
		st.cur += 1
		return yy30(st)
	case ' ':
		st.cur += 1
		return yy32(st)
	default:
		st.cur += 1
		return yy34(st)
	}
}

func yy31(st *State) int {
	yych := st.str[st.cur]
	switch (yych) {
	case '\n':
		st.cur += 1
		return yy28(st)
	default:
		if (st.lim <= st.cur) {
			st.yystate = 20
			return lexWaiting
		} else {
			return yy29(st)
		}
	}
}

func yy32(st *State) int {
	yych := st.str[st.cur]
	switch (yych) {
	case 0x00:
		fallthrough
	case 0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08:
		fallthrough
	case '\n','\v','\f':
		fallthrough
	case 0x0E,0x0F,0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17,0x18,0x19,0x1A,0x1B,0x1C,0x1D,0x1E:
		fallthrough
	case 0x7F:
		if (st.lim <= st.cur) {
			st.yystate = 21
			return lexWaiting
		} else {
			return yy29(st)
		}
	case '\t':
		st.cur += 1
		return yy30(st)
	case '\r':
		st.yytm1 = add_mtag(&st.trie, st.yytm1, st.cur)
		st.cur += 1
		return yy31(st)
	default:
		st.cur += 1
		return yy32(st)
	}
}

func yy33(st *State) int {
	yych := st.str[st.cur]
	switch (yych) {
	case 0x00:
		fallthrough
	case 0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08:
		fallthrough
	case '\n','\v','\f':
		fallthrough
	case 0x0E,0x0F,0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17,0x18,0x19,0x1A,0x1B,0x1C,0x1D,0x1E:
		fallthrough
	case 0x7F:
		if (st.lim <= st.cur) {
			st.yystate = 22
			return lexWaiting
		} else {
			return yy29(st)
		}
	case '\t':
		fallthrough
	case ' ':
		st.cur += 1
		return yy33(st)
	case '\r':
		st.yytm3 = add_mtag(&st.trie, st.yytm3, st.cur)
		st.yytm2 = st.yytm1
		st.yytm2 = add_mtag(&st.trie, st.yytm2, st.cur)
		st.cur += 1
		return yy35(st)
	default:
		st.yytm3 = add_mtag(&st.trie, st.yytm3, st.cur)
		st.cur += 1
		return yy36(st)
	}
}

func yy34(st *State) int {
	yych := st.str[st.cur]
	switch (yych) {
	case 0x00:
		fallthrough
	case 0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,'\t','\n','\v','\f':
		fallthrough
	case 0x0E,0x0F,0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17,0x18,0x19,0x1A,0x1B,0x1C,0x1D,0x1E:
		fallthrough
	case 0x7F:
		if (st.lim <= st.cur) {
			st.yystate = 23
			return lexWaiting
		} else {
			return yy29(st)
		}
	case '\r':
		st.yytm1 = add_mtag(&st.trie, st.yytm1, st.cur)
		st.cur += 1
		return yy31(st)
	default:
		st.cur += 1
		return yy32(st)
	}
}

func yy35(st *State) int {
	yych := st.str[st.cur]
	switch (yych) {
	case '\n':
		st.cur += 1
		return yy37(st)
	default:
		if (st.lim <= st.cur) {
			st.yystate = 24
			return lexWaiting
		} else {
			return yy29(st)
		}
	}
}

func yy36(st *State) int {
	yych := st.str[st.cur]
	switch (yych) {
	case 0x00:
		fallthrough
	case 0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08:
		fallthrough
	case '\n','\v','\f':
		fallthrough
	case 0x0E,0x0F,0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17,0x18,0x19,0x1A,0x1B,0x1C,0x1D,0x1E:
		fallthrough
	case 0x7F:
		if (st.lim <= st.cur) {
			st.yystate = 25
			return lexWaiting
		} else {
			return yy29(st)
		}
	case '\t':
		st.cur += 1
		return yy39(st)
	case '\r':
		st.yytm2 = st.yytm1
		st.yytm2 = add_mtag(&st.trie, st.yytm2, st.cur)
		st.cur += 1
		return yy35(st)
	default:
		st.cur += 1
		return yy36(st)
	}
}

func yy37(st *State) int {
	st.yyaccept = 1
	st.mar = st.cur
	yych := st.str[st.cur]
	switch (yych) {
	case '\t':
		fallthrough
	case ' ':
		st.yytm1 = st.yytm2
		st.cur += 1
		return yy33(st)
	default:
		if (st.lim <= st.cur) {
			st.yystate = 26
			return lexWaiting
		} else {
			return yy38(st)
		}
	}
}

func yy38(st *State) int {
	st.f1 = st.yytm1
	st.f2 = st.yytm3
	st.yystate = -1
//line "codegen/go/recursive_functions/advanced.re":165
	
		folds := unwind(st.trie, st.f1, st.f2, st.str)
		if debug {fmt.Printf("folds: %v\n", folds)}

		st.tok = st.cur
		return lex(st)

//line "codegen/go/recursive_functions/advanced.go":1038
}

func yy39(st *State) int {
	yych := st.str[st.cur]
	switch (yych) {
	case 0x00:
		fallthrough
	case 0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08:
		fallthrough
	case '\n','\v','\f':
		fallthrough
	case 0x0E,0x0F,0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17,0x18,0x19,0x1A,0x1B,0x1C,0x1D,0x1E:
		fallthrough
	case 0x7F:
		if (st.lim <= st.cur) {
			st.yystate = 27
			return lexWaiting
		} else {
			return yy29(st)
		}
	case '\t':
		st.cur += 1
		return yy39(st)
	case '\r':
		st.cur += 1
		return yy40(st)
	case ' ':
		st.cur += 1
		return yy36(st)
	default:
		st.cur += 1
		return yy41(st)
	}
}

func yy40(st *State) int {
	yych := st.str[st.cur]
	switch (yych) {
	case '\n':
		st.cur += 1
		return yy42(st)
	default:
		if (st.lim <= st.cur) {
			st.yystate = 28
			return lexWaiting
		} else {
			return yy29(st)
		}
	}
}

func yy41(st *State) int {
	yych := st.str[st.cur]
	switch (yych) {
	case 0x00:
		fallthrough
	case 0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08:
		fallthrough
	case '\n','\v','\f':
		fallthrough
	case 0x0E,0x0F,0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17,0x18,0x19,0x1A,0x1B,0x1C,0x1D,0x1E:
		fallthrough
	case 0x7F:
		if (st.lim <= st.cur) {
			st.yystate = 29
			return lexWaiting
		} else {
			return yy29(st)
		}
	case '\t':
		st.cur += 1
		return yy43(st)
	case '\r':
		st.yytm2 = st.yytm1
		st.yytm2 = add_mtag(&st.trie, st.yytm2, st.cur)
		st.cur += 1
		return yy35(st)
	default:
		st.cur += 1
		return yy36(st)
	}
}

func yy42(st *State) int {
	return yy38(st)
}

func yy43(st *State) int {
	yych := st.str[st.cur]
	switch (yych) {
	case '\t':
		fallthrough
	case ' ':
		st.cur += 1
		return yy43(st)
	case '\r':
		st.cur += 1
		return yy40(st)
	default:
		if (st.lim <= st.cur) {
			st.yystate = 30
			return lexWaiting
		} else {
			return yy29(st)
		}
	}
}

func yy44(st *State) int {
	st.yystate = -1
//line "codegen/go/recursive_functions/advanced.re":173
	return lexEnd
//line "codegen/go/recursive_functions/advanced.go":1151
}

func yyfnheader(st *State) int {
	return yy23(st)
}

func yy0(st *State) int {
	switch (st.yycond) {
	case yycmedia_type:
		return yyfnmedia_type(st)
	case yycheader:
		return yyfnheader(st)
	default:
		panic("internal lexer error")
	}
}

func lex(st *State) int {
	switch (st.yystate) {
	case -1:
		return yy0(st)
	case 0:
		if (st.lim <= st.cur) {
			return yy22(st)
		} else {
			return yy1(st)
		}
	case 1:
		if (st.lim <= st.cur) {
			return yy3(st)
		} else {
			return yy4(st)
		}
	case 2:
		if (st.lim <= st.cur) {
			return yy7(st)
		} else {
			return yy5(st)
		}
	case 3:
		if (st.lim <= st.cur) {
			return yy7(st)
		} else {
			return yy8(st)
		}
	case 4:
		if (st.lim <= st.cur) {
			return yy7(st)
		} else {
			return yy9(st)
		}
	case 5:
		if (st.lim <= st.cur) {
			return yy7(st)
		} else {
			return yy11(st)
		}
	case 6:
		if (st.lim <= st.cur) {
			return yy7(st)
		} else {
			return yy12(st)
		}
	case 7:
		if (st.lim <= st.cur) {
			return yy7(st)
		} else {
			return yy13(st)
		}
	case 8:
		if (st.lim <= st.cur) {
			return yy7(st)
		} else {
			return yy15(st)
		}
	case 9:
		if (st.lim <= st.cur) {
			return yy7(st)
		} else {
			return yy16(st)
		}
	case 10:
		if (st.lim <= st.cur) {
			return yy7(st)
		} else {
			return yy17(st)
		}
	case 11:
		if (st.lim <= st.cur) {
			return yy7(st)
		} else {
			return yy18(st)
		}
	case 12:
		if (st.lim <= st.cur) {
			return yy7(st)
		} else {
			return yy19(st)
		}
	case 13:
		if (st.lim <= st.cur) {
			return yy7(st)
		} else {
			return yy20(st)
		}
	case 14:
		if (st.lim <= st.cur) {
			return yy7(st)
		} else {
			return yy21(st)
		}
	case 15:
		if (st.lim <= st.cur) {
			return yy44(st)
		} else {
			return yy23(st)
		}
	case 16:
		if (st.lim <= st.cur) {
			return yy25(st)
		} else {
			return yy26(st)
		}
	case 17:
		if (st.lim <= st.cur) {
			return yy25(st)
		} else {
			return yy27(st)
		}
	case 18:
		if (st.lim <= st.cur) {
			return yy29(st)
		} else {
			return yy28(st)
		}
	case 19:
		if (st.lim <= st.cur) {
			return yy29(st)
		} else {
			return yy30(st)
		}
	case 20:
		if (st.lim <= st.cur) {
			return yy29(st)
		} else {
			return yy31(st)
		}
	case 21:
		if (st.lim <= st.cur) {
			return yy29(st)
		} else {
			return yy32(st)
		}
	case 22:
		if (st.lim <= st.cur) {
			return yy29(st)
		} else {
			return yy33(st)
		}
	case 23:
		if (st.lim <= st.cur) {
			return yy29(st)
		} else {
			return yy34(st)
		}
	case 24:
		if (st.lim <= st.cur) {
			return yy29(st)
		} else {
			return yy35(st)
		}
	case 25:
		if (st.lim <= st.cur) {
			return yy29(st)
		} else {
			return yy36(st)
		}
	case 26:
		if (st.lim <= st.cur) {
			return yy38(st)
		} else {
			return yy37(st)
		}
	case 27:
		if (st.lim <= st.cur) {
			return yy29(st)
		} else {
			return yy39(st)
		}
	case 28:
		if (st.lim <= st.cur) {
			return yy29(st)
		} else {
			return yy40(st)
		}
	case 29:
		if (st.lim <= st.cur) {
			return yy29(st)
		} else {
			return yy41(st)
		}
	case 30:
		if (st.lim <= st.cur) {
			return yy29(st)
		} else {
			return yy43(st)
		}
	default:
		panic("internal lexer error")
	}
}

//line "codegen/go/recursive_functions/advanced.re":175


func test(packets []string) int {
	fname := "pipe"
	fw, _ := os.Create(fname);
	fr, _ := os.Open(fname);

	st := &State{
		file:     fr,
		str:      make([]byte, SIZE+1),
		cur:      SIZE,
		mar:      SIZE,
		tok:      SIZE,
		lim:      SIZE,
		yycond:   yycmedia_type,
		yystate:  -1,
		trie:     make([]mtagElem, 0),
		
//line "codegen/go/recursive_functions/advanced.go":1383

		yyt1: tagNone,
		yyt2: tagNone,
//line "codegen/go/recursive_functions/advanced.re":192

		
//line "codegen/go/recursive_functions/advanced.go":1390

		yytm1: mtagRoot,
		yytm10: mtagRoot,
		yytm2: mtagRoot,
		yytm3: mtagRoot,
		yytm4: mtagRoot,
		yytm5: mtagRoot,
		yytm6: mtagRoot,
		yytm7: mtagRoot,
		yytm8: mtagRoot,
		yytm9: mtagRoot,
//line "codegen/go/recursive_functions/advanced.re":193

		l1:       0,
		l2:       0,
		f1:       0,
		f2:       0,
		p1:       0,
		p2:       0,
		p3:       0,
		p4:       0,
		yyaccept: 0,
	}
	// str is zero-initialized, no need to write sentinel

	var status int
	send := 0
loop:
	for {
		status = lex(st)
		if status == lexEnd {
			//fmt.Printf("ok, done\n")
			break loop
		} else if status == lexWaiting {
			//fmt.Printf("need more input\n")
			if send < len(packets) {
				//fmt.Printf("sending %d-th packet '%s'\n", send, packets[send])
				fw.WriteString(packets[send])
				send += 1
			}
			status = fill(st)
			if status != lexReady {
				break loop
			}
			//fmt.Printf("refilled buffer, ready to continue\n")
		} else if status == lexBadPacket {
			//fmt.Printf("bad packet\n")
			break loop
		} else {
			panic("unexpected status")
		}
	}

	fr.Close()
	fw.Close()
	os.Remove(fname)

	return status
}

func main() {
	packets := []string{"ap", "plication/j", "son;", " charset=\"", "utf\\\"-8\"\r", "\n", ""}
	if test(packets) != lexEnd { panic("error") }
}
