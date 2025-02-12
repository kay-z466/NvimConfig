-- test function
function Foo()
	print("Test function Runs!")
end

-- e ~/.local/state/nvim/shada/
--
local M = {}

function M.setup()
	local hl = vim.api.nvim_set_hl

	-- Set theme name
	vim.g.colors_name = "breezy"

	-- Background dependent Normal highlight
	local normal_bg = vim.o.background == "dark" and "#000000" or "#232629"
	hl(0, "Normal", { bg = normal_bg, fg = "#cfcfc2", bold = false })

	-- General UI Elements
	local highlights = {
		{ "LineNr",     "#31363b", "#7a7c7d" },
		{ "FoldColumn", "#31363b", "#7a7c7d" },
		{ "Folded",     "#31363b", "#7a7c7d" },
		{ "MatchParen", "#8e44ad", "#cfcfc2" },
		{ "SignColumn", "#31363b", "#7a7c7d" },
		{ "Comment",    "NONE",    "#7a7c7d" },
		{ "Conceal",    "NONE",    "#cfcfc2" },
		{ "Constant",   "NONE",    "#f67400" },
		{ "Boolean",    "NONE",    "#27aeae" },
		{ "Debug",      "NONE",    "#a5a6a8", true },
		{ "Error",      "#4d1f24", "#95da4c", true },
		{ "Identifier", "NONE",    "#8e44ad" },
		{ "Operator",   "NONE",    "NONE",    true },
		{ "PreProc",    "NONE",    "#27ae60" },
		{ "Special",    "NONE",    "#3daee9" },
		{ "Statement",  "NONE",    "#fdbc4b", true },
		{ "String",     "NONE",    "#f44f4f" },
		{ "Todo",       "#451e1a", "#ca9219" },
		{ "Type",       "NONE",    "#2980b9" },
		{ "Underlined", "NONE",    "#27ae60", false, "underline" },
	}

	-- Apply highlights
	for _, hlGroup in ipairs(highlights) do
		hl(0, hlGroup[1], { bg = hlGroup[2], fg = hlGroup[3], bold = hlGroup[4] or false, underline = hlGroup[5] or false })
	end

	-- Links
	local links = {
		{ "Character",    "String" },
		{ "Conditional",  "Statement" },
		{ "Define",       "Type" },
		{ "Delimiter",    "Normal" },
		{ "Exception",    "Statement" },
		{ "Float",        "Number" },
		{ "Function",     "Normal" },
		{ "Keyword",      "Operator" },
		{ "Label",        "Type" },
		{ "Macro",        "PreProc" },
		{ "Number",       "Constant" },
		{ "PreCondit",    "PreProc" },
		{ "Repeat",       "Statement" },
		{ "SpecialChar",  "Special" },
		{ "StorageClass", "Type" },
		{ "Structure",    "Type" },
		{ "Typedef",      "Type" },
	}

	-- Apply links
	for _, link in ipairs(links) do
		vim.cmd("hi! link " .. link[1] .. " " .. link[2])
	end
end

return M
