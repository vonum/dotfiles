return {
	"xiyaowong/transparent.nvim",
	lazy = false,
	config = function()
		require("transparent").clear_prefix("lualine")
		require("transparent").clear_prefix("Telescope")
		vim.keymap.set("n", "<leader>bg", ":TransparentToggle<cr>", { silent = true })
	end,
}
