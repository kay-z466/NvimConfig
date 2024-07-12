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

-- Place this in ${HOME}/.config/nvim/LuaSnip/all.lua
return {
	-- A snippet that expands the trigger "hi" into the string "Hello, world!".
	ls.snippet(
		{
			trig = "hi",
			dscr = "This is a test hello world snippet"
		},

		{ t("Hello, world!") }
	),

	-- To return multiple snippets, use one `return` statement per snippet file
	-- and return a table of Lua snippets.
	require("luasnip").snippet(
		{ trig = "foo" },
		{ t("Another snippet.") }
	),
	-- Demo for choice node
	s(
		"test",
		fmta("To <title> <> <Surname>.", {
			-- i(2, "Name"),
			i(2, "Name"),
			title = c(1, { t("Mr."), t("Ms.") }),
			Surname = c(3, { t("Khan"), t("not Khan") })
		})
	),
	s({ trig = "env" },
		fmta(
			[[
      \begin{<enviornment>}
          <>
      \end{}
    ]],
			{
				i(0), -- Exit node
				-- rep(1), -- this node repeats insert node i(1)
				enviornment = c(1, { t("math"), t("section") })
			}
		)
	),
	-- Sample for Function Node
	s(
		"mdtest",
		fmt('local {} require("{}")', {
			f(function(values)
				local value = values[1][1]
				local path = vim.split(value, '%.')
				return path[#path]
			end, { 1 }),
			i(1)
		})
	),

}
