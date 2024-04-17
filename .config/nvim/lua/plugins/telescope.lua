return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = {
            -- base dependency
            "nvim-lua/plenary.nvim",
            -- makes code actions pretty
            "nvim-telescope/telescope-ui-select.nvim",
            -- theme picker
            "andrew-george/telescope-themes",
        },
        config = function()
            require("telescope").setup({
                -- straigth up nvchads config
                defaults = {
                    vimgrep_arguments = {
                        "rg",
                        "-L",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                    },
                    prompt_prefix = " 😼 ",
                    selection_caret = "  ",
                    entry_prefix = "  ",
                    initial_mode = "insert",
                    selection_strategy = "reset",
                    sorting_strategy = "ascending",
                    layout_strategy = "horizontal",
                    layout_config = {
                        horizontal = {
                            prompt_position = "top",
                            preview_width = 0.70,
                        },
                        vertical = {
                            mirror = false,
                        },
                        width = 0.95,
                        --width = 0.87,
                        height = 0.80,
                        preview_cutoff = 100,
                    },
                    file_sorter = require("telescope.sorters").get_fuzzy_file,
                    file_ignore_patterns = { "node_modules", ".git" },
                    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
                    path_display = { "truncate" },
                    winblend = 0,
                    border = {},
                    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                    color_devicons = true,
                    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
                    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
                    -- Developer configurations: Not meant for general override
                    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
                    mappings = {
                        n = { ["q"] = require("telescope.actions").close },
                    },

                    extensions_list = { "themes", "terms" },
                },
                extensions = {
                    ["ui-select"] = { require("telescope.themes").get_dropdown({}) },
                    -- theme stuff
                    themes = {
                        enable_previewer = true, -- (boolean) -> show/hide previewer window
                        enable_live_preview = true, -- (boolean) -> enable/disable live preview
                        persist = {
                            enabled = true, -- enable persisting last theme choice
                            -- override path to file that execute colorscheme command
                            path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua",
                        },
                    },
                },
            })

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<C-z>", builtin.find_files, {})
            vim.keymap.set("n", "<C-w>", builtin.live_grep, {})

            -- theme picker
            vim.keymap.set(
                "n",
                "<F5>",
                ":Telescope themes<CR>",
                { noremap = true, silent = true, desc = "Theme Switcher" }
            )

            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("themes")
        end,
    },
}
