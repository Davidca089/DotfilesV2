local plugins = {
    {
        lazy = false,
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { { "nvim-lua/plenary.nvim" } },
        config = function()
            require "custom.configs.harpoon"
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "VeryLazy",
        opts = function()
            return require "custom.configs.null-ls"
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "clangd",
                "gopls",
                "lua-language-server",
                "clang-format",
            }
        }
    },
    {
        "NvChad/ui",
        config = function()
            vim.opt.statusline = ""
        end
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "olexsmir/gopher.nvim",
        ft = "go",
        config = function(_, opts)
            require("gopher").setup(opts)
        end,
        build = function()
            vim.cmd [[silent! GoInstallDeps]]
        end
    },
    {
        lazy = false,
        "jbyuki/instant.nvim",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                -- defaults
                "vim",
                "lua",
                "vimdoc",
                -- low level
                "c",
                "cpp",
            },
        },
    },
    --{
    --    lazy = false,
    --    "zbirenbaum/copilot.lua",
    --    event = "InsertEnter",
    --    config = function()
    --        require("copilot").setup({})
    --    end,
    --},
    --{
    --    "hrsh7th/nvim-cmp",
    --    dependencies = {
    --        {
    --            "zbirenbaum/copilot-cmp",
    --            config = function ()
    --                require("copilot_cmp").setup()
    --            end,
    --        },
    --    },
    --    opts = {
    --        sources = {
    --            { name = "copilot" , group_index = 2},
    --            { name = "nvim_lsp", group_index = 2},
    --            { name = "luasnip" , group_index = 2},
    --            { name = "buffer" , group_index = 2},
    --            { name = "nvim_lua" , group_index = 2},
    --            { name = "path" , group_index = 2},
    --        },
    --    },
    --},
}

return plugins
