-- test function
function Foo()
	print("Test function Runs!")
end

local function open_vifm()
	local tmpfile = "/tmp/vifm_selected"         -- Temporary file to store the selected file
	os.execute("vifm --choose-files " .. tmpfile) -- Open vifm and store the selection

	local file = vim.fn.readfile(tmpfile)[1]     -- Read the first selected file from the tmpfile
	if file and file ~= "" then
		vim.cmd("edit " .. vim.fn.fnameescape(file)) -- Open the file in a new buffer
	end

	os.remove(tmpfile) -- Clean up the temporary file
end

vim.api.nvim_create_user_command("VifmOpen", open_vifm, {}) -- Create a :VifmOpen command


local function open_lazygit()
	os.execute("footclient -e lazygit &")
end

vim.api.nvim_create_user_command("LazyGitOpen", open_lazygit, {}) -- Create a :LazyGitOpen command
