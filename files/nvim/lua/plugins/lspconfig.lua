return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", opts = {}},
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = {
          "pyright",
          "rust_analyzer",
          "ts_ls",
          "rubocop",
          "solc",
          "marksman",
          "gopls",
          "yamlls",
          "lua_ls",
        }
      },
      dependencies = {"williamboman/mason.nvim"}
    },
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function ()
    local lspconfig = require("lspconfig")
    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

    lspconfig.pyright.setup({ capabilities = lsp_capabilities, })
    lspconfig.rust_analyzer.setup({ capabilities = lsp_capabilities, })
    lspconfig.solc.setup({ capabilities = lsp_capabilities, })
    lspconfig.rubocop.setup({ capabilities = lsp_capabilities, })
    lspconfig.ts_ls.setup({ capabilities = lsp_capabilities, })
    lspconfig.marksman.setup({ capabilities = lsp_capabilities, })
    lspconfig.gopls.setup({ capabilities = lsp_capabilities, })

    lspconfig.lua_ls.setup({
      capabilities = lsp_capabilities,
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
        },
      },
    })

    lspconfig.yamlls.setup({
      capabilities = lsp_capabilities,
      settings = {
        yaml = {
          schemas = {
            kubernetes = "*.yaml",
            ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
            ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
            ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
          },
        }
      }
    })

    local custom_map = function(type, key, value)
      -- vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true})
      vim.keymap.set(type, key, value, {noremap = true, silent = true})
    end

    custom_map("n", "<leader>gD", "<cmd> lua vim.lsp.buf.declaration()<cr>")
    custom_map("n", "<leader>gd", "<cmd> lua vim.lsp.buf.definition()<cr>")
    custom_map("n", "<leader>gi", "<cmd> lua vim.lsp.buf.implementation()<cr>")
    custom_map("n", "<leader>gt", "<cmd> lua vim.lsp.buf.type_definition()<cr>")
    custom_map("n", "<leader>gr", "<cmd> lua vim.lsp.buf.references()<cr>")
    custom_map("n", "<leader>ai", "<cmd> lua vim.lsp.buf.incoming_calls()<cr>")
    custom_map("n", "<leader>ao", "<cmd> lua vim.lsp.buf.outgoing_calls()<cr>")
    custom_map("n", "<leader>ar", "<cmd> lua vim.lsp.buf.rename()<cr>")
    custom_map("n", "<leader>gh", "<cmd> lua vim.lsp.buf.hover()<cr>")
    -- custom_map("n","<leader>er","<cmd> lua vim.lsp.util.show_line_diagnostics()<cr>")
    custom_map("n","<leader>=", "<cmd> lua vim.lsp.buf.formatting()<cr>")
  end,
}
