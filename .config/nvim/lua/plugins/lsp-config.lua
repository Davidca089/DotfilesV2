return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    -- "clangd",
                    -- "pyright",
                    -- "ocamllsp",
                    -- "gopls",
                    -- "lua_ls",
                    -- "tsserver",
                    -- "rust_analyzer",
                    --"clang-format",
                },
            })
        end,
    },
    {
        "folke/neodev.nvim",
        opts = {},
    },
    {
        "neovim/nvim-lspconfig",
        -- neovim develop
        dependecies = { "folke/neodev.nvim", opts = {} },
        lazy = false,
        config = function()
            -- asks the lsp server to send back some extra information basically
            -- thats why -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
            require("neodev").setup({})
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            -- local base =
            -- local util = require("lspconfig.util")

            -- server setup
            -- lspconfig.pylsp.setup({
            -- 	capabilities = capabilities,
            -- })

            -- lspconfig.tsserver.setup({
            --     capabilities = capabilities,
            --     -- root_dir = util.root_pattern(".git"),
            -- })
            -- lspconfig.pyright.setup({
            --     capabilities = capabilities,
            -- })
            -- lspconfig.lua_ls.setup({
            --     capabilities = capabilities,
            -- })
            -- lspconfig.gopls.setup({
            --     capabilities = capabilities,
            -- })
            -- lspconfig.clangd.setup({
            --     capabilities = capabilities,
            --     cmd = {
            --         "clangd",
            --         "--offset-encoding=utf-16",
            --     },
            -- })
            -- lspconfig.ocamllsp.setup({
            --     capabilities = capabilities,
            -- })

            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            -- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
