-- Test function
function Foo()
	print("Test function Runs!")
end

-------------------------------------------------------------------------------------------------------
-- Function to open VIFM
local function open_vifm()
	local tmpfile = "/tmp/vifm_selected"

	local terminal_cmd = "foot -e vifm --choose-files " .. tmpfile --TODO add support for konsole

	vim.fn.jobstart(terminal_cmd,
		{ --jobstart for async VIFM instance makes it less laggy + no editor warnings
			on_exit = function(_, exit_code)
				if exit_code == 0 then
					local file = vim.fn.readfile(tmpfile)[1]
					if file and file ~= "" then
						vim.cmd("edit " .. vim.fn.fnameescape(file))
					end
					os.remove(tmpfile)
				end
			end,
		})
end
vim.api.nvim_create_user_command("VifmOpen", open_vifm, {})

-------------------------------------------------------------------------------------------------------
-- Function to open lazygit

local function open_lazygit()
	local cwd = vim.fn.getcwd()
	local cmd = { "foot", "-e", "lazygit" }

	vim.fn.jobstart(cmd, {
		cwd = cwd,
		detach = true,
	})
end


vim.api.nvim_create_user_command("LazyGitOpen", open_lazygit, {})


local function open_scratch()
	vim.cmd("enew")
	vim.bo.buftype = "nofile"
	vim.bo.bufhidden = "hide"
	vim.bo.swapfile = false
end

vim.api.nvim_create_user_command("Scratch", open_scratch, { desc = "Open a scratch buffer" })
-------------------------------------------------------------------------------------------------------
-- Open Shada

function Shada()
	local shada_path = vim.fn.stdpath("state") .. "/shada/main.shada"
	vim.cmd("edit " .. shada_path)
end

vim.api.nvim_create_user_command("Shada", Shada, {})
