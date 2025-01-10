return {
  {"tpope/vim-repeat"},
  {"tpope/vim-commentary"},
  {"cohama/lexima.vim"},
  {
    "bkad/CamelCaseMotion",
    config = function ()
      vim.cmd([[
        map ,w <Plug>CamelCaseMotion_w
        map ,b <Plug>CamelCaseMotion_b
        map ,e <Plug>CamelCaseMotion_e
        sunmap ,w
        sunmap ,b
        sunmap ,e
      ]])
    end
  },
  {
    "janko/vim-test",
    keys = {
      {"<leader>'", "<cmd>TestFile<cr>", desc = "Run module tests."},
      {"<leader>;", "<cmd>TestNearest<cr>", desc = "Run single test"},
    },
    config = function()
      vim.cmd([[
        let g:gitgutter_map_keys = 0
        let g:gitgutter_signs = 0
      ]])
    end
  },
}
