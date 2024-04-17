return {
    -- the setup is done with telescope via <leader>th
    { "Shatur/neovim-ayu" },
    { "EdenEast/nightfox.nvim" },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                -- use the night style
                style = "night",
                -- disable italic for functions
                styles = {
                    functions = {},
                },
                sidebars = { "qf", "vista_kind", "terminal", "packer" },
                -- Change the "hint" color to the "orange" color, and make the "error" color bright red
                on_colors = function(colors)
                    colors.bg = "#000000"
                    colors.error = "#ff0000"
                end,
                on_highlights = function(hl, c)
                    local prompt = "#2d3149"
                    hl.TelescopeNormal = {
                        bg = c.bg_dark,
                        fg = "#ffffff",
                    }
                    hl.TelescopeBorder = {
                        bg = c.bg_dark,
                        fg = c.bg_dark,
                    }
                    hl.TelescopePromptNormal = {
                        bg = prompt,
                        fg = "#ffffff",
                    }
                    hl.TelescopePromptBorder = {
                        bg = prompt,
                        fg = prompt,
                    }
                    hl.TelescopePromptTitle = {
                        bg = prompt,
                        fg = prompt,
                    }
                    hl.TelescopePreviewTitle = {
                        bg = c.bg_dark,
                        fg = c.bg_dark,
                    }
                    hl.TelescopeResultsTitle = {
                        bg = c.bg_dark,
                        fg = c.bg_dark,
                    }
                end,
            })
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<C-z>", builtin.find_files, {})
            vim.keymap.set("n", "<C-w>", builtin.live_grep, {})
        end,
    },
}
