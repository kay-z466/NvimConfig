local types = require("luasnip.util.types")
vim.cmd [[
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'

imap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
smap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
]]

-- Load snippets from ~/.config/nvim/config/LuaSnip/
require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/config/LuaSnip/" })
--

-- Somewhere in your Neovim startup, e.g. init.lua
require("luasnip").config.set_config({ -- Setting LuaSnip config   -- TODO  update events

	-- Enable autotriggered snippets
	history = true,
	enable_autosnippets = true,
	update_events = { "TextChanged", "TextChangedI" },
	-- Use Tab (or some other key if you prefer) to trigger visual selection
	store_selection_keys = "<Tab>",
	ext_opts = {
		[types.choiceNode] = {
			active = { virt_text = { { "●", "Orange" } }, hl_mode = "combine" }
		}
	}
})
