// re2c $INPUT -o $OUTPUT -i --leftmost-captures --fixed-tags toplevel
// POSIX and leftmost policies produce different results.

/*!re2c
    ("a")? ("b" | "bb")* {}
*/
