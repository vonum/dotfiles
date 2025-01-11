return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  opts = {
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
      "kdl"
    },
    sync_install = true,
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  }
}
