vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

-- tabbing made right
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 20

--vim.g.copilot_assume_mapped = true
--vim.g.copilot_no_tab_map = true

--vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
--vim.api.nvim_set_keymap("i", "<C-H>", 'copilot#Previous()', { silent = true, expr = true })
--vim.api.nvim_set_keymap("i", "<C-K>", 'copilot#Next()', { silent = true, expr = true })

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argv(0) == "" then
            require("telescope.builtin").find_files({ follow = true, no_ignore = true, hidden = true })
        end
    end,
})
