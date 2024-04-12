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
                "ocaml-lsp",
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
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                -- defaults
                "vim",
                "lua",
                "python",
                "vimdoc",
                -- low level
                "c",
                "cpp",
            },
        },
    },
    {
        lazy = false,
        'VonHeikemen/searchbox.nvim',
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
    },
    {
        lazy = false,
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require "custom.configs.oil"
        end,
    },
    -- {
    --     "chrisgrieser/nvim-early-retirement",
    --     config = true,
    --     event = "VeryLazy",
    -- },
    -- {
    --     lazy = false,
    --     "zbirenbaum/copilot.lua",
    --     event = "InsertEnter",
    --     config = function()
    --         require("copilot").setup({})
    --     end,
    -- },
    -- {
    --     "hrsh7th/nvim-cmp",
    --     dependencies = {
    --         {
    --             "zbirenbaum/copilot-cmp",
    --             config = function()
    --                 require("copilot_cmp").setup()
    --             end,
    --         },
    --     },
    --     opts = {
    --         sources = {
    --             { name = "copilot",   group_index = 2 },
    --             { name = "nvim_lsp",  group_index = 2 },
    --             { name = "luasnip",   group_index = 2 },
    --             { name = "buffer",    group_index = 2 },
    --             { name = "nvim_lua",  group_index = 2 },
    --             { name = "path",      group_index = 2 },
    --         },
    --     },
    -- },
}

return plugins
