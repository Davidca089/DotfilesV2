local languages = { 'go', 'python', 'c', 'lua', 'rust' }

return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        branch = "main",
    },
    {
        'MeanderingProgrammer/treesitter-modules.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        opts = {
            ensure_installed = languages,
            highlight = { enable = true },
            indent = { enable = true },
        },
    },
}
