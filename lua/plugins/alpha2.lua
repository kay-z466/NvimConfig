return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	opts = function()
		local dashboard = require("alpha.themes.dashboard")
		local logo = [[
       /----\
      |      |
    ------------
      /~~~~~~\
     /'    -O- ~~~~\
    /'dHHb      ~~~~\
   /'dHHHA     :
  /' VHHHHaadHHb:
 /'   `VHHHHHHHHb:
/'      `VHHHHHHH:
/'        dHHHHHHH:   `7MM"""Mq.                             888     888 8888888 888b     d888
|        dHHHHHHHH:     MM   `MM.                            888     888   888   8888b   d8888
|       VHHHHHHHHH:     MM   ,M9 .gP"Ya `7MMpMMMb.  .P"Ybmmm 888     888   888   88888b.d88888
|   b    HHHHHHHHV:     MMmmdM9 ,M'   Yb  MM    MM :MI  I8   Y88b   d88P   888   888Y88888P888
|   Hb   HHHHHHHV'      MM      8M""""""  MM    MM  WmmmP"    Y88b d88P    888   888 Y888P 888
|   HH  dHHHHHHV'       MM      YM.    ,  MM    MM 8M          Y88o88P     888   888  Y8P  888
|   VHbdHHHHHHV'      .JMML.     `Mbmmd'.JMML  JMML.YMMMMMb     Y888P      888   888   "   888
|    VHHHHHHHV'                                    6'     dP     Y8P     8888888 888       888
 \oodboooooodH                                      Ybmmmd'
HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
      ]]
		dashboard.section.header.val = vim.split(logo, "\n")
		dashboard.section.buttons.val = {
			dashboard.button("f", "󰍉 " .. " Find File", ":Telescope find_files <CR>"),
			dashboard.button("n", " " .. " New File", ":ene <BAR> startinsert <CR>"),
			dashboard.button("o", " " .. " Older Files", ":Telescope oldfiles <CR>"),
			dashboard.button("g", " " .. " Find Text", ":Telescope live_grep <CR>"),
			dashboard.button("c", " " .. " Config", ":cd ~/.config/nvim <CR>"),
			dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
			dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
			dashboard.button("q", " " .. " Quit", ":qa<CR>"),
		}
		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = "AlphaButtons"
			button.opts.hl_shortcut = "AlphaShortcut"
		end
		dashboard.section.header.opts.hl = "AlphaHeader"
		dashboard.section.buttons.opts.hl = "AlphaButtons"
		dashboard.section.footer.opts.hl = "AlphaFooter"
		dashboard.opts.layout[1].val = 8
		return dashboard
	end,
	config = function(_, dashboard)
		-- close Lazy and re-open when the dashboard is ready
		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				pattern = "AlphaReady",
				callback = function()
					require("lazy").show()
				end,
			})
		end

		require("alpha").setup(dashboard.opts)

		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				dashboard.section.footer.val = " Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
	end,
}
--           //                 /#
--       ///////               ####
--    ////////////             ######
-- //.//////////////          #########/
-- ////./////////////         #########/.   #      # ####### #######  888     888 8888888 888b     d888
-- //////./////////////       #########/.   ##     # #       #     #  888     888   888   8888b   d8888
-- ////////.////////////      #########(.   # #    # #       #     #  888     888   888   88888b.d88888
-- ////////|\/////////////    #########(.   #  #   # #####   #     #  Y88b   d88P   888   888Y88888P888
-- ||||||||| |//////////////  #########(.   #   #  # #       #     #   Y88b d88P    888   888 Y888P 888
-- |||||||||    ///////////// #########(.   #    # # #       #     #    Y88o88P     888   888  Y8P  888
-- |||||||||      ////////////#########(.   #     ## #       #     #     Y888P      888   888   "   888
-- (||||||||        //////////#########(.   #      # ####### #######      Y8P     8888888 888       888
-- |||||||||          ////////#########(.
--  ||||||||             /////########
--    ||||||              ////#######
--      ||||                //####
--        ||                  ##
--                                                        /$$               /$$
--                                                       |  $$             |__/
--   /$$$$$$  /$$$$$$/$$$$   /$$$$$$   /$$$$$$$  /$$$$$$$ \  $$  /$$    /$$ /$$ /$$$$$$/$$$$
--  /$$__  $$| $$_  $$_  $$ |____  $$ /$$_____/ /$$_____/  \  $$|  $$  /$$/| $$| $$_  $$_  $$
-- | $$$$$$$$| $$ \ $$ \ $$  /$$$$$$$| $$      |  $$$$$$    /$$/ \  $$/$$/ | $$| $$ \ $$ \ $$
-- | $$_____/| $$ | $$ | $$ /$$__  $$| $$       \____  $$  /$$/   \  $$$/  | $$| $$ | $$ | $$
-- |  $$$$$$$| $$ | $$ | $$|  $$$$$$$|  $$$$$$$ /$$$$$$$/ /$$/     \  $/   | $$| $$ | $$ | $$
--  \_______/|__/ |__/ |__/ \_______/ \_______/|_______/ |__/       \_/    |__/|__/ |__/ |__/
