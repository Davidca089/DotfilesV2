vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

-- tabbing made right
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.cindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 20

vim.opt.colorcolumn = "80"

vim.opt.filetype = "on"
vim.opt.indentexpr = ""

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argv(0) == "" then
            require("telescope.builtin").find_files({ follow = true, no_ignore = true, hidden = true })
        end
    end,
})
