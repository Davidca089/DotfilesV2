return {
	"VonHeikemen/searchbox.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	config = function()
		-- normal
		vim.keymap.set("n", "/", ":SearchBoxMatchAll <CR>")
		vim.keymap.set("n", "<leader>s", ":SearchBoxMatchAll exact=true -- <C-r>=expand('<cword>')<CR><CR>")
		vim.keymap.set("n", "<leader>r", ":SearchBoxReplace exact=true -- <C-r>=expand('<cword>')<CR><CR>")
		-- execution
		vim.keymap.set("x", "<leader>r", ":SearchBoxReplace modifier=':\\C' visual_mode=true<CR>")
		vim.keymap.set("x", "<leader>R", ":SearchBoxReplace exact=true -- <C-r>=expand('<cword>')<CR><CR>")
	end,
}
