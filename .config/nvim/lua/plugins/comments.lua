return {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
        require("Comment").setup({
            toggler = {
                line = "<Tab>",
            },
            opleader = {
                line = "<Tab>",
            },
        })
    end,
}
