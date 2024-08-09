local augroup = vim.api.nvim_create_augroup("ScratchMe", { clear = true })

local function createBuffer()
	local buf = vim.api.nvim_create_buf(true, true)
	vim.api.nvim_buf_set_name(buf, "*ScratchMe*")
	vim.api.nvim_set_option_value("filetype", "lua", { buf = buf })

	return buf
end

local function main()
	print("ScratchMe Loaded Hi")

	local buf = createBuffer()

	vim.api.nvim_buf_set_lines(buf, 0, -1, true, { "-- Welcome to Neovim!", "" })

	--	vim.api.nvim_win_set_buf(0, buf)

	vim.api.nvim_win_set_cursor(0, { vim.api.nvim_buf_line_count(buf), 0 })
end

local function setup()
	vim.api.nvim_create_autocmd("VimEnter", {
		group = augroup,
		desc = "Creating a Scratch buffer for notes on load",
		once = true,
		callback = main,
	})
end

return { setup = setup }
