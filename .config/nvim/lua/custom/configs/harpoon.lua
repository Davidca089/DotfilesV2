local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

-- Delete buffers not used when leaving them
-- vim.api.nvim_create_autocmd("BufLeave", {
--     callback = function()
--     local bufinfos = vim.fn.getbufinfo({ buflisted = true })
--     vim.tbl_map(function(bufinfo)
--         if bufinfo.changed == 0 and (not bufinfo.windows or #bufinfo.windows == 0) then
--             vim.api.nvim_buf_delete(bufinfo.bufnr, { force = false, unload = false })
--         end
--     end, bufinfos)
--     end,
-- })

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)

vim.keymap.set("n", "<leader>h", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>t", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>n", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>s", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<leader>.", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
