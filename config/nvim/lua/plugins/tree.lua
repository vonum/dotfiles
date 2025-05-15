return {
  "kyazdani42/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      view = {
        width = 30,
      },
      filters = {
        dotfiles = false,
      },

    })

    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", { silent = true })
    vim.cmd("hi NvimTreeNormal guibg=NONE ctermbg=NONE")
  end
}
