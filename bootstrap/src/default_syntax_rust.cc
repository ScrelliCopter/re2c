#include "src/parse/conf_parser.h"
const char* DEFAULT_SYNTAX_RUST =
    "supported_apis = [\"generic\", \"record\"];\n"
    "supported_api_styles = [\"free-form\"];\n"
    "supported_code_models = [\"loop_switch\", \"recursive_functions\"];\n"
    "supported_targets = [\"code\", \"dot\"];\n"
    "supported_features = [\"nested_ifs\", \"case_ranges\", \"unsafe\"];\n"
    "\n"
    "semicolons = 1;\n"
    "implicit_bool_conversion = 0;\n"
    "backtick_quoted_strings = 0;\n"
    "standalone_single_quotes = 1;\n"
    "indentation_sensitive = 0;\n"
    "wrap_blocks_in_braces = 1;\n"
    "\n"
    "conf:api = custom;\n"
    "conf:api:style = free-form;\n"
    "conf:api:sigil = \"@@\";\n"
    "conf:define:YYGETCOND:naked = 0;\n"
    "conf:define:YYSETCOND:naked = 0;\n"
    "conf:define:YYSETCOND@cond = \"@@\";\n"
    "conf:define:YYGETSTATE:naked = 0;\n"
    "conf:define:YYSETSTATE:naked = 0;\n"
    "conf:define:YYSETSTATE@state = \"@@\";\n"
    "conf:define:YYFILL@len = \"@@\";\n"
    "conf:define:YYFILL:naked = 0;\n"
    "conf:define:YYFN = [\"<undefined-function-name>;<undefined-function-type>\"];\n"
    "conf:yyfn:sep = \";\";\n"
    "conf:variable:yycond = \"yycond\";\n"
    "conf:variable:yyctable = \"yyctable\";\n"
    "conf:variable:yyaccept = \"yyaccept\";\n"
    "conf:variable:yytarget = \"yytarget\";\n"
    "conf:variable:yystate = \"yystate\";\n"
    "conf:variable:yynmatch = \"yynmatch\";\n"
    "conf:variable:yypmatch = \"yypmatch\";\n"
    "conf:variable:yyrecord = \"yyrecord\";\n"
    "conf:variable:yych = \"yych\";\n"
    "conf:variable:yych:conversion = 0;\n"
    "conf:variable:yych:literals = hex;\n"
    "conf:variable:yych:emit = (code_model.recursive_functions ? 0 : 1);\n"
    "conf:variable:yybm = \"yybm\";\n"
    "conf:variable:yybm:hex = 0;\n"
    "conf:variable:yyfill = \"\";\n"
    "conf:variable:yystable = \"\"; // deprecated\n"
    "conf:header = \"\";\n"
    "conf:eof = -1;\n"
    "conf:sentinel = -1;\n"
    "conf:yyfill:enable = 1;\n"
    "conf:yyfill:parameter = 1;\n"
    "conf:yyfill:check = 1;\n"
    "conf:tags = 0;\n"
    "conf:leftmost-captures = 0;\n"
    "conf:posix-captures = 0;\n"
    "conf:tags:prefix = \"yyt\";\n"
    "conf:invert-captures = 0;\n"
    "conf:cond:abort = 1;\n"
    "conf:cond:prefix = \"yyc_\";\n"
    "conf:cond:enumprefix = \"YYC_\";\n"
    "conf:cond:divider@cond = \"@@\";\n"
    "conf:cond:goto@cond = \"@@\";\n"
    "conf:state:abort = 1;\n"
    "conf:state:nextlabel = 0;\n"
    "conf:bit-vectors = 0;\n"
    "conf:debug-output = 0;\n"
    "conf:computed-gotos = 0;\n"
    "conf:computed-gotos:threshold = 9;\n"
    "conf:nested-ifs = 0;\n"
    "conf:case-insensitive = 0;\n"
    "conf:case-inverted = 0;\n"
    "conf:case-ranges = 1;\n"
    "conf:unsafe = 1;\n"
    "conf:monadic = 0;\n"
    "conf:encoding:ebcdic = 0;\n"
    "conf:encoding:utf32 = 0;\n"
    "conf:encoding:ucs2 = 0;\n"
    "conf:encoding:utf16 = 0;\n"
    "conf:encoding:utf8 = 0;\n"
    "conf:encoding-policy = ignore;\n"
    "conf:empty-class = match-empty;\n"
    "conf:indent:string = \"\\t\";\n"
    "conf:indent:top = 0;\n"
    "conf:label:prefix = \"yy\";\n"
    "conf:label:yyfill = \"yyFillLabel\";\n"
    "conf:label:yyloop = \"'yyl\"; // In Rust `continue` statements have labels, use it to avoid ambiguity.\n"
    "conf:label:yyNext = \"yyNext\";\n"
    "conf:label:start = 0;\n"
    "\n"
    "conf:define:YYBACKUP = \"YYBACKUP\";\n"
    "conf:define:YYBACKUPCTX = \"YYBACKUPCTX\";\n"
    "conf:define:YYCONDTYPE = \"YYCONDTYPE\";\n"
    "conf:define:YYCOPYMTAG = sigil \"{lhs} = \" sigil \"{rhs};\";\n"
    "conf:define:YYCOPYSTAG = sigil \"{lhs} = \" sigil \"{rhs};\";\n"
    "conf:define:YYCTYPE = \"YYCTYPE\";\n"
    "conf:define:YYCTXMARKER = (api.record ? record \".yyctxmarker\" : \"YYCTXMARKER\");\n"
    "conf:define:YYCURSOR = (api.record ? record \".yycursor\" : \"YYCURSOR\");\n"
    "conf:define:YYDEBUG = \"YYDEBUG\";\n"
    "conf:define:YYFILL = \"YYFILL\";\n"
    "conf:define:YYGETACCEPT = sigil \"{var}\";\n"
    "conf:define:YYGETCOND = \"YYGETCONDITION\"; // historic default\n"
    "conf:define:YYGETSTATE = \"YYGETSTATE\";\n"
    "conf:define:YYINPUT = (api.record ? record \".yyinput\" : \"YYINPUT\");\n"
    "conf:define:YYLESSTHAN = \"YYLESSTHAN\";\n"
    "conf:define:YYLIMIT = (api.record ? record \".yylimit\" : \"YYLIMIT\");\n"
    "conf:define:YYMARKER = (api.record ? record \".yymarker\" : \"YYMARKER\");\n"
    "conf:define:YYMAXFILL = \"YYMAXFILL\";\n"
    "conf:define:YYMAXNMATCH = \"YYMAXNMATCH\";\n"
    "conf:define:YYMTAGN = \"YYMTAGN\";\n"
    "conf:define:YYMTAGP = \"YYMTAGP\";\n"
    "conf:define:YYPEEK = (api.record ? \"get_unchecked\" : \"YYPEEK\");\n"
    "conf:define:YYRESTORE = \"YYRESTORE\";\n"
    "conf:define:YYRESTORECTX = \"YYRESTORECTX\";\n"
    "conf:define:YYRESTORETAG = \"YYRESTORETAG\";\n"
    "conf:define:YYSETACCEPT = sigil \"{var} = \" sigil \"{val};\";\n"
    "conf:define:YYSETCOND = \"YYSETCONDITION\"; // historic default\n"
    "conf:define:YYSETSTATE = \"YYSETSTATE\";\n"
    "conf:define:YYSHIFT = \"YYSHIFT\";\n"
    "conf:define:YYSHIFTSTAG = \"YYSHIFTSTAG\";\n"
    "conf:define:YYSHIFTMTAG = \"YYSHIFTMTAG\";\n"
    "conf:define:YYSKIP = \"YYSKIP\";\n"
    "conf:define:YYSTAGN = \"YYSTAGN\";\n"
    "conf:define:YYSTAGP = \"YYSTAGP\";\n"
    "conf:tags:expression = (api.record ? record \".\") sigil;\n"
    "conf:cond:divider = \"\";\n"
    "conf:cond:goto = \"\";\n"
    "\n"
    "code:var_local =\n"
    "    // In Rust uninitialized variable is an error, but if the compiler is able to see\n"
    "    // that all paths overwrite the initial value, it warns about unused assignments.\n"
    "    (!have_init ? topindent \"#[allow(unused_assignments)]\" nl)\n"
    "    topindent \"let mut \" name \" : \" type \" = \" init \";\" nl;\n"
    "code:var_global = topindent \"static mut \" name \" : \" type \" = \" init \";\" nl;\n"
    "\n"
    "code:const_local = topindent \"const \" name \": \" type \" = \" init \";\" nl;\n"
    "code:const_global = code:const_local;\n"
    "\n"
    "// code:array_local\n"
    "// code:array_global\n"
    "code:array_elem = array \"[\" index \"]\";\n"
    "\n"
    "code:type_int = \"isize\";\n"
    "code:type_uint = \"usize\";\n"
    "code:type_cond_enum = (storable_state? \"isize\" : \"usize\");\n"
    "// code:type_yybm\n"
    "// code:type_yytarget\n"
    "\n"
    "code:assign = topindent lhs \" = \" rhs \";\" nl;\n"
    "\n"
    "code:if_then_else =\n"
    "    [branch{0}: topindent \"if \" cond \" {\" nl\n"
    "        indent [stmt: stmt] dedent]\n"
    "    [branch{1:-1}: topindent \"} else \" (have_cond? \"if \" cond \" \") \"{\" nl\n"
    "        indent [stmt: stmt] dedent]\n"
    "    topindent \"}\" nl;\n"
    "\n"
    "code:switch =\n"
    "    topindent \"match \" expr \" {\" nl\n"
    "        indent [case: case] dedent\n"
    "    topindent \"}\" nl;\n"
    "\n"
    "code:switch_cases =\n"
    "    [case{0:-2}: topindent case \" |\" nl]\n"
    "    [case{-1}:   topindent case \" => {\" nl\n"
    "        indent [stmt: stmt] dedent\n"
    "    topindent \"}\" nl];\n"
    "\n"
    "code:switch_cases_oneline =\n"
    "    [case{0:-2}: topindent case \" |\" nl]\n"
    "    [case{-1}:   topindent case \" => \" [stmt: stmt] \",\" nl];\n"
    "\n"
    "code:switch_case_range = [val{0}: val] (many ? \" ..= \" [val{-1}: val]);\n"
    "\n"
    "code:switch_case_default = \"_\";\n"
    "\n"
    "code:loop =\n"
    "    topindent (loop_label? label \": \") \"loop {\" nl\n"
    "        indent [stmt: stmt] dedent\n"
    "    topindent \"}\" nl;\n"
    "\n"
    "code:enum = [elem: topindent \"const \" elem \": \" type \" = \" init \";\" nl];\n"
    "\n"
    "code:enum_elem = name;\n"
    "\n"
    "code:fndef =\n"
    "    topindent \"fn \" name \"(\"\n"
    "        [arg{0:-2}: argname \": \" argtype \", \"]\n"
    "        [arg{-1}:   argname \": \" argtype]\n"
    "    \")\" (have_type ? \" -> \" type) \" {\" nl\n"
    "        indent [stmt: stmt] dedent\n"
    "    \"}\" nl;\n"
    "\n"
    "code:fncall = topindent name \"(\" [arg{0:-2}: arg \", \"] [arg{-1}: arg] \")\" nl;\n"
    "\n"
    "code:tailcall = code:fncall;\n"
    "\n"
    "code:recursive_functions = [fn: fndef nl];\n"
    "\n"
    "code:fingerprint =\n"
    "    \"/* Generated by re2c\" (have_version? \" \" version) (have_date? \" on \" date) \" */\" nl;\n"
    "\n"
    "// No line directives in Rust: https://github.com/rust-lang/rfcs/issues/1862.\n"
    "//code:line_info\n"
    "\n"
    "code:abort = topindent \"panic!(\\\"internal lexer error\\\")\" nl;\n"
    "\n"
    "code:yydebug =\n"
    "    topindent (api.record\n"
    "        ? debug \"(\" record \")\"\n"
    "        : debug\n"
    "    ) nl;\n"
    "\n"
    "code:yypeek =\n"
    "    topindent (code_model.recursive_functions ? \"let \") char \" = \" (api.record\n"
    "        ? (unsafe\n"
    "            ? \"unsafe {*\" input \".\" peek \"(\" cursor \")}\"\n"
    "            : input \"[\" cursor \"]\")\n"
    "        : (unsafe\n"
    "            ? \"unsafe {\" peek \"}\"\n"
    "            : peek)\n"
    "    ) \";\" nl;\n"
    "\n"
    "code:yyskip =\n"
    "    topindent (api.record\n"
    "        ? cursor \" += 1;\"\n"
    "        : skip\n"
    "    ) nl;\n"
    "\n"
    "code:yybackup =\n"
    "    topindent (api.record\n"
    "        ? marker \" = \" cursor \";\"\n"
    "        : backup\n"
    "    ) nl;\n"
    "\n"
    "code:yybackupctx =\n"
    "    topindent (api.record\n"
    "        ? ctxmarker \" = \" cursor \";\"\n"
    "        : backupctx\n"
    "    ) nl;\n"
    "\n"
    "code:yyrestore =\n"
    "    topindent (api.record\n"
    "        ? cursor \" = \" marker \";\"\n"
    "        : restore\n"
    "    ) nl;\n"
    "\n"
    "code:yyrestorectx =\n"
    "    topindent (api.record\n"
    "        ? cursor \" = \" ctxmarker \";\"\n"
    "        : restorectx\n"
    "    ) nl;\n"
    "\n"
    "code:yyrestoretag =\n"
    "    topindent (api.record\n"
    "        ? cursor \" = \" tag \";\"\n"
    "        : restoretag\n"
    "    ) nl;\n"
    "\n"
    "code:yyshift =\n"
    "    topindent (api.record\n"
    "        ? cursor \" -= \" offset \";\"\n"
    "        : shift\n"
    "    ) nl;\n"
    "\n"
    "code:yyshiftstag =\n"
    "    (nested ? topindent \"if \" tag \" != \" (api.record ? \"usize::MAX\" : neg) \" {\" nl indent)\n"
    "        topindent (api.record\n"
    "            ? tag \" -= \" offset \";\"\n"
    "            : shiftstag\n"
    "        ) nl\n"
    "    (nested ? dedent topindent \"}\" nl);\n"
    "\n"
    "code:yyshiftmtag = topindent shiftmtag nl;\n"
    "\n"
    "code:yystagp =\n"
    "    topindent (api.record\n"
    "        ? tag \" = \" cursor \";\"\n"
    "        : stagp\n"
    "    ) nl;\n"
    "\n"
    "code:yymtagp = topindent mtagp nl;\n"
    "\n"
    "code:yystagn =\n"
    "    topindent (api.record\n"
    "        ? tag \" = usize::MAX;\"\n"
    "        : stagn\n"
    "    ) nl;\n"
    "\n"
    "code:yymtagn = topindent mtagn nl;\n"
    "\n"
    "code:yycopystag =\n"
    "    topindent (api.record\n"
    "        ? lhs \" = \" rhs \";\"\n"
    "        : copystag\n"
    "    ) nl;\n"
    "\n"
    "code:yycopymtag =\n"
    "    topindent (api.record\n"
    "        ? lhs \" = \" rhs \";\"\n"
    "        : copymtag\n"
    "    ) nl;\n"
    "\n"
    "code:yygetaccept =\n"
    "    (api.record\n"
    "        ? (storable_state | code_model.recursive_functions ? record \".\") var\n"
    "        : getaccept);\n"
    "\n"
    "code:yysetaccept =\n"
    "    topindent (api.record\n"
    "        ? (storable_state | code_model.recursive_functions ? record \".\") var \" = \" val \";\"\n"
    "        : setaccept\n"
    "    ) nl;\n"
    "\n"
    "code:yygetcond = (api.record ? record \".\" var : getcond);\n"
    "\n"
    "code:yysetcond =\n"
    "    topindent (api.record\n"
    "        ? record \".\" var \" = \" val \";\"\n"
    "        : setcond\n"
    "    ) nl;\n"
    "\n"
    "code:yygetstate = (api.record ? record \".\" var : getstate);\n"
    "\n"
    "code:yysetstate =\n"
    "    topindent (api.record\n"
    "        ? record \".\" var \" = \" val \";\"\n"
    "        : setstate\n"
    "    ) nl;\n"
    "\n"
    "code:yylessthan =\n"
    "    (api.record\n"
    "        ? (many\n"
    "            ? \"(\" limit \" - \" cursor \") < \" need\n"
    "            : limit \" <= \" cursor)\n"
    "        : lessthan);\n"
    ;
