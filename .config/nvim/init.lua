-- lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

-- mappings
require("set")

-- lazy
require("lazy").setup("plugins")

-- custom
require("custom_cmds")

-- set highlight groups

vim.cmd([[autocmd FileType * set formatoptions-=ro]])
local group = vim.api.nvim_create_augroup("Highlighting", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	group = group,
	callback = function()
		local purp = "#5c1b66"
		local grey = "#2d3149"
		-- general
		vim.api.nvim_set_hl(0, "IncSearch", { fg = "#ffffff", bg = grey })
		vim.api.nvim_set_hl(0, "Search", { fg = "#ffffff", bg = grey })
		-- flash
		vim.api.nvim_set_hl(0, "FlashCursor", { fg = "#ffffff", bg = grey })
		vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#ffffff", bg = purp })
	end,
})

-- colorscheme stuff
require("colorscheme")

-- on enter run this function
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.argv(0) == "" then
			require("telescope.builtin").find_files({ follow = true, no_ignore = true, hidden = true })
		end
	end,
})

-- interact with TMUX for filename
local tmux_namer = vim.api.nvim_create_augroup("TmuxNamer", { clear = true })
vim.api.nvim_create_autocmd("FocusLost", {
	pattern = "*",
	group = tmux_namer,
	callback = function()
		-- update env variable storing name in file
		local file = io.open("/tmp/tmux_namer", "w")
		local str = ";)"
		io.output(file)
		io.write(str)
		io.close(file)
	end,
})

vim.api.nvim_create_autocmd({ "BufWrite", "BufWinEnter", "FocusGained" }, {
	pattern = "*",
	group = tmux_namer,
	callback = function()
		-- update env variable storing name in file
		local file = io.open("/tmp/tmux_namer", "w")
		local str = string.sub(string.gsub(vim.api.nvim_buf_get_name(0), vim.loop.cwd(), ""), 2)
		io.output(file)
		io.write(str)
		io.close(file)
	end,
})
