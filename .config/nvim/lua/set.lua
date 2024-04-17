-- mapppings
vim.cmd("set noswapfile")
vim.g.mapleader = " "
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.o.background = "dark"

vim.opt.laststatus = 0
-- ruler

vim.opt.clipboard = "unnamedplus"

-- Indenting
vim.opt.smartindent = false
vim.opt.scrolloff = 20
vim.opt.nu = true
vim.opt.colorcolumn = "80"
vim.opt.rnu = true

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
vim.keymap.set({ "n", "v", "i" }, "<C-t>", ":!t<CR>")
