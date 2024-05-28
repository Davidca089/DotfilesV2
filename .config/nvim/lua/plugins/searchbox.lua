return {
	"VonHeikemen/searchbox.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	config = function()
		-- enable vim mode
		require("searchbox").setup({
			hooks = {
				after_mount = function(input)
					local opts = { buffer = input.bufnr }
					-- Esc goes to normal mode
					vim.keymap.set("i", "<C-c>", "<cmd>stopinsert<cr>", opts)
				end,
			},
		})

		-- replace
		vim.keymap.set("n", "<leader>r", ":SearchBoxReplace exact=true -- <C-r>=expand('<cword>')<CR><CR>")
		vim.keymap.set("x", "<leader>r", ":SearchBoxReplace modifier=':\\C' visual_mode=true<CR>")
	end,
}
