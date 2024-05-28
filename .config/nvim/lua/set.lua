-- mapppings
vim.g.mapleader = " "
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- backups
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- colorscheme
vim.o.background = "dark"
vim.opt.termguicolors = true

-- remove BLOATED messages (statusline)
vim.opt.laststatus = 0
vim.opt.cmdheight = 0
vim.api.nvim_set_hl(0, "Statusline", { link = "Normal" })
vim.api.nvim_set_hl(0, "StatuslineNC", { link = "Normal" })
vim.opt.statusline = string.rep("-", vim.api.nvim_win_get_width(0))

-- Indenting
vim.opt.smartindent = false
vim.opt.scrolloff = 20
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.colorcolumn = "80"

-- insert
vim.keymap.set("i", "<C-c>", "<Esc>")

-- visual
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", "J", ":m'>+<CR>gv=gv")
vim.keymap.set("v", "K", ":m-2<CR>gv=gv")
vim.keymap.set("v", "<leader>y", '"+y')

-- normal
vim.keymap.set("n", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set("n", "<C-\\>", ":LazyGit <CR>")

-- save file
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>")
vim.keymap.set("n", "<C-c>", "<cmd> %y+ <CR>")

-- execution
vim.keymap.set("n", "<leader>p", '"_dP')

-- global
-- tmux session stuff
vim.keymap.set({ "n", "v", "i" }, "<C-t>", ":silent !t<CR>")
vim.keymap.set("n", "<leader>js", ":!node %<CR>")
