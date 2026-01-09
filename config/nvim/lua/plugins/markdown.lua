return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },
    opts = {},
    config = function()
      require('render-markdown').setup({
        completions = { lsp = { enabled = false } },
      })
      vim.keymap.set("n", "<leader>md", ":RenderMarkdown buf_toggle<cr>", { silent = true })
    end
  },
  {
    "timantipov/md-table-tidy.nvim",
    opts = {
      padding = 1,
      key = "<leader>tt",
    }
  },
  {
    "gaoDean/autolist.nvim",
    event = "InsertCharPre",
    dependencies = "hrsh7th/nvim-cmp",
    ft = {
      "markdown",
      "text",
      "tex",
      "plaintex",
      "norg",
    },
    config = function()
      local autolist = require("autolist")
      autolist.setup()


      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "markdown", "text", "tex", "plaintex", "norg" },
        callback = function()
          vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>")
          vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>")

          local opts = { buffer = true, silent = true }
          vim.keymap.set("i", "<cr>", "<cr><cmd>AutolistNewBullet<cr>", opts)
          vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>", opts)
          vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>", opts)

          vim.keymap.set("n", "<leader>cn", require("autolist").cycle_next_dr, { expr = true })
          vim.keymap.set("n", "<leader>cp", require("autolist").cycle_prev_dr, { expr = true })

          vim.keymap.set("n", ">>", ">><cmd>AutolistRecalculate<cr>")
          vim.keymap.set("n", "<<", "<<<cmd>AutolistRecalculate<cr>")
          vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<cr>")
          vim.keymap.set("v", "d", "d<cmd>AutolistRecalculate<cr>")
        end,
      })
    end,
  },
}
