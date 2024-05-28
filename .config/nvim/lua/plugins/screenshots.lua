return {
	"mistricky/codesnap.nvim",
	build = "make",
	config = function()
		require("codesnap").setup({
			mac_window_bar = false,
			title = "Snapshot",
			code_font_family = "Hack",
			watermark = "",
			bg_color = "#212121",
			breadcrumbs_separator = "/",
			has_breadcrumbs = false,
		})
		vim.keymap.set("x", "<F8>", ":CodeSnap<CR>")
	end,
}
