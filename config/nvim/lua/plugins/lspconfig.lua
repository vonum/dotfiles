return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", opts = {} },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = {
          "lua_ls",
          "gopls",
          "pyright",
          "rust_analyzer",
          "elixirls",
          "ts_ls",
          -- "rubocop",
          "solc",
          "marksman",
          "yamlls",
          "terraformls",
        }
      },
      dependencies = { "williamboman/mason.nvim" }
    },
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
    }

    lspconfig.gopls.setup({
      capabilities = lsp_capabilities,
      handlers = handlers
    })
    lspconfig.pyright.setup({
      capabilities = lsp_capabilities,
      handlers = handlers
    })
    lspconfig.rust_analyzer.setup({
      capabilities = lsp_capabilities,
      handlers = handlers
    })
    lspconfig.elixirls.setup({
      capabilities = lsp_capabilities,
      handlers = handlers
    })
    lspconfig.solc.setup({
      capabilities = lsp_capabilities,
      handlers = handlers
    })
    lspconfig.rubocop.setup({
      capabilities = lsp_capabilities,
      handlers = handlers
    })
    lspconfig.ts_ls.setup({
      capabilities = lsp_capabilities,
      handlers = handlers
    })
    lspconfig.marksman.setup({
      capabilities = lsp_capabilities,
      handlers = handlers
    })

    lspconfig.terraformls.setup({
      capabilities = lsp_capabilities,
      handlers = handlers,
      init_options = {
        terraform = {
          path = "/opt/homebrew/bin/terraform"
        }
      }
    })

    lspconfig.lua_ls.setup({
      capabilities = lsp_capabilities,
      handlers = handlers,
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
          },
        },
      },
    })

    lspconfig.yamlls.setup({
      capabilities = lsp_capabilities,
      handlers = handlers,
      settings = {
        yaml = {
          schemas = {
            kubernetes = "*.yaml",
            ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
            ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
            ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
            "*docker-compose*.{yml,yaml}",
          },
        }
      }
    })

    local custom_map = function(type, key, value)
      -- vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true})
      vim.keymap.set(type, key, value, { noremap = true, silent = true })
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
    custom_map("n", "<leader>er", "<cmd> lua vim.diagnostic.open_float()<cr>")
    custom_map("n", "<leader>=", "<cmd> lua vim.lsp.buf.formatting()<cr>")
  end,
}
