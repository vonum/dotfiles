return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      char = "¦",
    },
    scope = {
      enabled = true,
      show_start = false,
      show_exact_scope = true,
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
