return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("rose-pine")
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
