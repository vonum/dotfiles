return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      char = "¦",
    },
    scope = {
      enabled = false,
      show_start = false,
      show_exact_scope = false,
    },
    exclude = {
      filetypes = {
        "man",
        "help",
        "terminal",
        "dashboard",
        "gitcommit",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
      },
    }
  },
}
