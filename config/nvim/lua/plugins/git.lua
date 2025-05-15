return {
  {
    "tpope/vim-fugitive",
    config = function()
      vim.cmd("set filetype=fugitiveblame")
      vim.keymap.set("n", "<leader>gb", ":Git blame<cr>", { silent = true })
    end
  },
  {
    "airblade/vim-gitgutter",
    config = function()
      vim.cmd("let g:gitgutter_map_keys = 0")
      vim.cmd("let g:gitgutter_signs = 0")

      vim.keymap.set("n", "<leader>df", ":GitGutterSignsToggle<cr>", { silent = true })
    end
  }
}
