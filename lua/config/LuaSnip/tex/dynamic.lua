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


-- ----------------------------------------------------------------------------
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
-- ----------------------------------------------------------------------------


-- Include this `in_mathzone` function at the start of a snippets file...
local in_mathzone = function()
	-- The `in_mathzone` function requires the VimTeX plugin
	return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
-- Then pass the table `{condition = in_mathzone}` to any snippet you want to
-- expand only in math contexts.




return {


	-- snippet for visual bold
	s({ trig = "tbb", dscr = "Expands 'tii' into LaTeX's textit{} command." },
		fmta("\\textbf{<>}",
			{
				d(1, get_visual),
			}
		)
	),


	-- snippet for visual textit
	s({ trig = "tii", dscr = "Expands 'tii' into LaTeX's textit{} command." },
		fmta("\\textit{<>}",
			{
				d(1, get_visual),
			}
		)
	),

	-- snippet fo text mode inside math
	s(
		{
			trig = "txt",
			snippetType = "autosnippet",
			condition = in_mathzone
		},
		fmta(
			"\\text{<>}",
			{
				i(1)
			})
	),

	-- snippet for fraction
	s({
			trig = '(%S+)by',    -- Match anything before "by"
			regTrig = true,      -- Enable regex trigger
			wordTrig = false,    -- Allow part-word expansion
			snippetType = "autosnippet",
			condition = in_mathzone -- Restrict to math mode
		},
		fmta(
			"\\frac{<>}{<>}",                               -- LaTeX fraction format
			{
				f(function(_, snip) return snip.captures[1] end), -- Capture everything before "by"
				i(1)                                          -- Insert node for the denominator, allowing user input
			}
		)),

	-- snippet for subscript
	s({
			trig = '([%a%)%]%}])sub', -- Trigger: A variable or closing bracket followed by "sub"
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone
		},
		fmta(
			"<>_{<>}",                                      -- Format: Base character with a subscript
			{
				f(function(_, snip) return snip.captures[1] end), -- Capture the base character
				i(1)                                          -- Insert node inside the subscript for user input
			}
		)
	),

	-- snippet to raise to a power
	s({
			trig = '([%a%)%]%}])to', -- Trigger: A variable or closing bracket followed by "to"
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone
		},
		fmta(
			"<>^{<>}",                                      -- Format: Base character with a superscript
			{
				f(function(_, snip) return snip.captures[1] end), -- Capture the base character
				i(1)                                          -- Insert node inside the subscript for user input
			}
		)
	),


	s({
			trig = 'exp', -- Trigger: A variable or closing bracket followed by "to"
			snippetType = "autosnippet",
			condition = in_mathzone
		},
		fmta(
			"e^{<>}", -- Format: Base character with a superscript
			{
				i(1) -- Insert node inside the subscript for user input
			}
		)
	),

	s({ trig = '([%a%)%]%}])00', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta(
			"<>_{<>}",
			{
				f(function(_, snip) return snip.captures[1] end),
				t("0")
			}
		)
	),

	-- snippet for matrix
	s({
			trig = "mat(%d+)b(%d+)", -- Match "mat<n>b<m>"
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		{
			t("\\begin{"), i(1, "bmatrix"), t("}"), -- Cursor starts inside \begin{...}
			t({ "", "" }),                       -- New line
			d(2, function(args, snip)
				local rows = tonumber(snip.captures[1])
				local cols = tonumber(snip.captures[2])

				local nodes = {}

				for row = 1, rows do                         -- Use `row` instead of `i` to avoid conflict
					for col = 1, cols do
						table.insert(nodes, i((row - 1) * cols + col)) -- Insert input nodes
						if col < cols then
							table.insert(nodes, t(" & "))          -- Add '&' between columns
						end
					end
					if row < rows then
						table.insert(nodes, t({ " \\", "" })) -- Add '\\' at the end of each row
					end
				end

				return sn(nil, nodes)
			end),
			t({ "", "\\end{" }), rep(1), t("}"), -- Close matrix with the same type entered in \begin{}
		})




}

--TODO: Add snippets for Quantum Calculus and Vectors
