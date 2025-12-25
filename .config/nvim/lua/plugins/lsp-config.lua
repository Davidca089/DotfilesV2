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
                    "clangd",
                    "lua_ls",
                    "rust_analyzer",
                    "pyright",
                    "gopls",
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

            -- server setup
            -- lspconfig.tsserver.setup({
            --     capabilities = capabilities,
            --     -- root_dir = util.root_pattern(".git"),
            -- })

            vim.lsp.config("pyright", {
                capabilities = capabilities,
            })
            vim.lsp.enable("pyright")

            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
            })
            vim.lsp.enable("lua_ls")

            vim.lsp.config("gopls", {
                capabilities = capabilities,
            })
            vim.lsp.enable("gopls")

            vim.lsp.config("clangd", {
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--offset-encoding=utf-16",
                },
            })
            vim.lsp.enable("clangd")


            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            -- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
