return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "go",
        "rust",
        "lua",
        "solidity",
        "python",
        "ruby",
        "elixir",
        "sql",
        "markdown",
        "typescript",
        "javascript",
        "toml",
        "json",
        "yaml",
        "kdl",
        "bash",
      },
      sync_install = true,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      disable = { "dockerfile" },
    })
  end
}
