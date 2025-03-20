local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key


return {
	s("bplatex", {
		t({
			"\\documentclass[a4paper,11pt]{article}",
			"\\usepackage[utf8]{inputenc}",
			"\\usepackage{amsmath,amssymb,graphicx}",
			"\\usepackage{hyperref}",
			"\\title{",
		}),
		i(1, "Title"), t({ "}" }),
		t({ "", "\\author{" }),
		i(2, "Your Name"), t({ "}" }),
		t({ "", "\\date{\\today}", "", "\\begin{document}", "", "\\maketitle", "", "\\section{Introduction}", "", }),
		i(3, "Your text here..."),
		t({ "", "", "\\end{document}" })
	}),
}
