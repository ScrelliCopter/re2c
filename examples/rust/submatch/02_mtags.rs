/* Generated by re2c */
// re2rust $INPUT -o $OUTPUT

const NONE: usize = std::usize::MAX;
const MTAG_ROOT: usize = NONE - 1;

// An m-tag tree is a way to store histories with an O(1) copy operation.
// Histories naturally form a tree, as they have common start and fork at some
// point. The tree is stored as an array of pairs (tag value, link to parent).
// An m-tag is represented with a single link in the tree (array index).
type MtagTrie = Vec::<MtagElem>;
struct MtagElem {
    elem: usize, // tag value
    pred: usize, // index of the predecessor node or root
}

// Append a single value to an m-tag history.
fn add_mtag(trie: &mut MtagTrie, mtag: usize, value: usize) -> usize {
    trie.push(MtagElem{elem: value, pred: mtag});
    return trie.len() - 1;
}

// Recursively unwind tag histories and collect version components.
fn unwind(trie: &MtagTrie, x: usize, y: usize, str: &[u8], ver: &mut Ver) {
    // Reached the root of the m-tag tree, stop recursion.
    if x == MTAG_ROOT && y == MTAG_ROOT { return; }

    // Unwind history further.
    unwind(trie, trie[x].pred, trie[y].pred, str, ver);

    // Get tag values. Tag histories must have equal length.
    assert!(x != MTAG_ROOT && y != MTAG_ROOT);
    let (ex, ey) = (trie[x].elem, trie[y].elem);

    if ex != NONE && ey != NONE {
        // Both tags are valid string indices, extract component.
        ver.push(s2n(&str[ex..ey]));
    } else {
        // Both tags are NONE (this corresponds to zero repetitions).
        assert!(ex == NONE && ey == NONE);
    }
}

type Ver = Vec::<u32>; // unbounded number of version components

fn s2n(str: &[u8]) -> u32 { // convert a pre-parsed string to a number
    let mut n = 0;
    for i in str { n = n * 10 + *i as u32 - 48; }
    return n;
}

fn parse(str: &[u8]) -> Option<Ver> {
    assert_eq!(str.last(), Some(&0)); // expect null-terminated input

    let (mut cur, mut mar) = (0, 0);
    let mut mt: MtagTrie = Vec::new();

    // User-defined tag variables that are available in semantic action.
    let (t1, t2, t3, t4);

    // Autogenerated tag variables used by the lexer to track tag values.
    let mut yyt1 = NONE;let mut yyt2 = NONE;
    let mut yytm3 = MTAG_ROOT;let mut yytm4 = MTAG_ROOT;

    
{
	#[allow(unused_assignments)]
	let mut yych : u8 = 0;
	let mut yystate : usize = 0;
	'yyl: loop {
		match yystate {
			0 => {
				yych = unsafe {*str.get_unchecked(cur)};
				match yych {
					0x30 ..= 0x39 => {
						yyt1 = cur;
						cur += 1;
						yystate = 3;
						continue 'yyl;
					}
					_ => {
						cur += 1;
						yystate = 1;
						continue 'yyl;
					}
				}
			}
			1 => {
				yystate = 2;
				continue 'yyl;
			}
			2 => { return None; }
			3 => {
				mar = cur;
				yych = unsafe {*str.get_unchecked(cur)};
				match yych {
					0x00 => {
						yytm4 = add_mtag(&mut mt, yytm4, NONE);
						yytm3 = add_mtag(&mut mt, yytm3, NONE);
						yyt2 = cur;
						cur += 1;
						yystate = 4;
						continue 'yyl;
					}
					0x2E => {
						yyt2 = cur;
						cur += 1;
						yystate = 5;
						continue 'yyl;
					}
					0x30 ..= 0x39 => {
						cur += 1;
						yystate = 7;
						continue 'yyl;
					}
					_ => {
						yystate = 2;
						continue 'yyl;
					}
				}
			}
			4 => {
				t1 = yyt1;
				t2 = yyt2;
				t3 = yytm3;
				t4 = yytm4;
				{
            let mut ver: Ver = Vec::new();
            ver.push(s2n(&str[t1..t2]));
            unwind(&mt, t3, t4, str, &mut ver);
            return Some(ver);
        }
			}
			5 => {
				yych = unsafe {*str.get_unchecked(cur)};
				match yych {
					0x30 ..= 0x39 => {
						yytm3 = add_mtag(&mut mt, yytm3, cur);
						cur += 1;
						yystate = 8;
						continue 'yyl;
					}
					_ => {
						yystate = 6;
						continue 'yyl;
					}
				}
			}
			6 => {
				cur = mar;
				yystate = 2;
				continue 'yyl;
			}
			7 => {
				yych = unsafe {*str.get_unchecked(cur)};
				match yych {
					0x00 => {
						yytm4 = add_mtag(&mut mt, yytm4, NONE);
						yytm3 = add_mtag(&mut mt, yytm3, NONE);
						yyt2 = cur;
						cur += 1;
						yystate = 4;
						continue 'yyl;
					}
					0x2E => {
						yyt2 = cur;
						cur += 1;
						yystate = 5;
						continue 'yyl;
					}
					0x30 ..= 0x39 => {
						cur += 1;
						yystate = 7;
						continue 'yyl;
					}
					_ => {
						yystate = 6;
						continue 'yyl;
					}
				}
			}
			8 => {
				yych = unsafe {*str.get_unchecked(cur)};
				match yych {
					0x00 => {
						yytm4 = add_mtag(&mut mt, yytm4, cur);
						cur += 1;
						yystate = 4;
						continue 'yyl;
					}
					0x2E => {
						yytm4 = add_mtag(&mut mt, yytm4, cur);
						cur += 1;
						yystate = 5;
						continue 'yyl;
					}
					0x30 ..= 0x39 => {
						cur += 1;
						yystate = 8;
						continue 'yyl;
					}
					_ => {
						yystate = 6;
						continue 'yyl;
					}
				}
			}
			_ => {
				panic!("internal lexer error")
			}
		}
	}
}

}

fn main() {
    assert_eq!(parse(b"1\0"), Some(vec![1]));
    assert_eq!(parse(b"1.2.3.4.5.6.7\0"), Some(vec![1, 2, 3, 4, 5, 6, 7]));
    assert_eq!(parse(b"1.2.\0"), None);
}
