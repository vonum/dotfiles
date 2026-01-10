return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1000,
	config = function()
		require("rose-pine").setup({
			-- disable_background = true,
			-- disable_floating_background = true,
		})
		vim.cmd.colorscheme("rose-pine")

		-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none" })

		-- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none" })

		-- vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
	end,
}

-- return {
--   "oskarnurm/koda.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     -- require("koda").setup({ transparent = true })
--     vim.cmd("colorscheme koda")
--   end,
-- }
