-- test function
function Foo()
	print("Test function Runs!")
end

-------------------------------------------------------------------------------------------------------
-- Function to open VIFM
local function open_vifm()
	local tmpfile = "/tmp/vifm_selected"

	-- Command to open Terminal and run vifm
	local terminal_cmd = "$TERM -e vifm --choose-files " .. tmpfile

	-- Run the command
	vim.fn.jobstart(terminal_cmd, { --jobstart for async VIFM instance makes it less laggy
		on_exit = function(_, exit_code)
			if exit_code == 0 then
				-- Read the selected file after vifm exits
				local file = vim.fn.readfile(tmpfile)[1]
				if file and file ~= "" then
					vim.cmd("edit " .. vim.fn.fnameescape(file))
				end
				os.remove(tmpfile) -- Clean up the temporary file
			end
		end,
	})
end
vim.api.nvim_create_user_command("VifmOpen", open_vifm, {}) -- Create a :VifmOpen command

-------------------------------------------------------------------------------------------------------
-- Function to open lazygit
local function open_lazygit()
	os.execute("footclient -e lazygit &")
end

vim.api.nvim_create_user_command("LazyGitOpen", open_lazygit, {}) -- Create a :LazyGitOpen command
