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

-- Summary: When `LS_SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `LS_SELECT_RAW` is empty, the function simply returns an empty insert node.
local get_visual = function(args, parent)
	if (#parent.snippet.env.LS_SELECT_RAW > 0) then
		return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
	else -- If LS_SELECT_RAW is empty, return a blank insert node
		return sn(nil, i(1))
	end
end

-- Place this in ${HOME}/.config/nvim/LuaSnip/all.lua
return {
	-- - Examples of Greek letter snippets, autotriggered for efficiency
	s({ trig = ";a", snippetType = "autosnippet" },
		{
			t("\\alpha"),
		}
	),
	s({ trig = ";b", snippetType = "autosnippet" },
		{
			t("\\beta"),
		}
	),
	s({ trig = ";g", snippetType = "autosnippet" },
		{
			t("\\gamma"),
		}
	),
	-- Yes, these jumbles of text nodes and insert nodes get messy fast, and yes,
	-- there is a much better, human-readable solution: ls.fmt, described shortly.
	s({ trig = "ff", dscr = "Expands 'ff' into '\frac{}{}'" },
		{
			t("\\frac{"),
			i(1), -- insert node 1
			t("}{"),
			i(2), -- insert node 2
			t("}")
		}
	),

	-- fmt and fmta human readable code

	s({ trig = "eq", name = "equation", dscr = "A LaTeX equation environment" },
		fmt( -- The snippet code actually looks like the equation environment it produces.
			[[
      \begin{equation}
          <>
      \end{equation}
    ]],
			-- The insert node is placed in the <> angle brackets
			{ i(0) },
			-- This is where I specify that angle brackets are used as node positions.
			{ delimiters = "<>" }
		)
	),
	s({ trig = "env" },
		fmta(
			[[
      \begin{<>}
          <>
      \end{<>}
    ]],
			{
				i(1),
				i(0), -- Exit node
				rep(1), -- this node repeats insert node i(1)
			}
		)
	),
	-- Example use of insert node placeholder text
	s({ trig = "hr", dscr = "The hyperref package's href{}{} command (for url links)" },
		fmta(
			[[\href{<>}{<>}]],
			{
				i(1, "url"),
				i(2, "display name"),
			}
		)
	),

	s({ trig = "tii", dscr = "Expands 'tii' into LaTeX's textit{} command." },
		fmta("\\textit{<>}",
			{
				d(1, get_visual),
			}
		)
	),

}
--
