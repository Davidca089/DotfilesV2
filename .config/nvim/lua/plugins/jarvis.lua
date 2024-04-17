return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("chatgpt").setup({
			api_key_cmd = "pass show openai_key",
		})
	end,

	vim.keymap.set("n", "<F12>", ":ChatGPT<CR>"),
	vim.keymap.set("n", "<F11>t", ":ChatGPTRun add_tests<CR>"),
	vim.keymap.set("n", "<F11>b", ":ChatGPTRun fix_bugs<CR>"),
	vim.keymap.set("v", "<F11>e", ":ChatGPTRun explain_code<CR>"),
	vim.keymap.set("n", "<F10>", ":ChatGPTEditWithInstructions<CR>"),
	vim.keymap.set("n", "<F9>", ":ChatGPTCompleteCode<CR>"),
}
