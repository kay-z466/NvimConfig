-- test function
function Foo()
	print("Test function Runs!")
end

local M = {}

-- Default options
local default_opts = {
	zoxide_cmd = "zoxide", -- The zoxide command
	behaviour = "global", -- Default behaviour: 'global', 'tabs', or 'window'
}

-- Setup function (optional, for customization)
function M.setup(opts)
	M.opts = vim.tbl_deep_extend("force", default_opts, opts or {})
end

-- Resolve the directory using zoxide
function M.resolve(args)
	-- If no arguments are provided, default to the home directory
	if #args == 0 then
		return os.getenv("HOME")
	end

	-- Combine arguments into a single query string
	local query = table.concat(args, " ")

	-- Run zoxide query and capture the output
	local cmd = string.format("%s query -- %s", M.opts.zoxide_cmd, vim.fn.shellescape(query))
	local handle = io.popen(cmd)
	local result = handle:read("*a")
	handle:close()

	-- Trim whitespace and newlines from the result
	result = result:gsub("%s+$", "")

	-- Check if the result is a valid directory
	if result ~= "" and vim.fn.isdirectory(result) == 1 then
		return result
	else
		return nil, "No matching directory found for: " .. query
	end
end

-- Change directory based on the resolved path
function M.cd(args, behaviour)
	behaviour = behaviour or M.opts.behaviour

	-- Resolve the directory using zoxide
	local path, err = M.resolve(args)
	if not path then
		vim.notify(err, vim.log.levels.ERROR)
		return
	end

	-- Add the directory to zoxide's database
	vim.fn.system({ M.opts.zoxide_cmd, "add", "--", path })

	-- Change the directory based on the specified behaviour
	if behaviour == "tabs" then
		vim.cmd("tcd " .. vim.fn.fnameescape(path))
	elseif behaviour == "window" then
		vim.cmd("lcd " .. vim.fn.fnameescape(path))
	else
		vim.cmd("cd " .. vim.fn.fnameescape(path))
	end

	-- Notify the user
	vim.notify("Changed directory to: " .. path, vim.log.levels.INFO)
end

-- Create a user command for easy access
function M.create_command()
	vim.api.nvim_create_user_command("Zcd", function(opts)
		M.cd(opts.fargs, M.opts.behaviour)
	end, {
		nargs = "+",   -- Accept one or more arguments
		complete = "file", -- Enable file path completion
	})
end

-- Initialize the module
M.setup()          -- Apply default options
M.create_command() -- Create the :Zcd command

return M
