return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    {
      "mason-org/mason-lspconfig.nvim",
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
        },
        automatic_enable = false,
      },
      dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" }
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
      on_init = function(client)
        local poetry_env = vim.fn.trim(vim.fn.system("poetry env info -p"))
        client.config.settings.python.pythonPath = poetry_env .. "/bin/python"
        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        return true
      end,
      capabilities = lsp_capabilities,
      handlers = handlers,
      -- python = {
      --   pythonPath = vim.fn.trim(vim.fn.system("uv run which python")),
      -- },
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
            globals = { "vim" },
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

    -- local custom_map = function(type, key, value)
    --   -- vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true})
    --   vim.keymap.set(type, key, value, { noremap = true, silent = true })
    -- end
    -- custom_map("n", "<leader>=", "<cmd> lua vim.lsp.buf.formatting()<cr>")

    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function()
        local bufmap = function(mode, lhs, rhs)
          local opts = { buffer = true }
          vim.keymap.set(mode, lhs, rhs, opts)
        end

        bufmap('n', 'K', vim.lsp.buf.hover)
        bufmap('n', 'gd', vim.lsp.buf.definition)
        bufmap('n', 'gD', vim.lsp.buf.declaration)
        bufmap('n', 'gi', vim.lsp.buf.implementation)
        bufmap('n', 'gt', vim.lsp.buf.type_definition)

        bufmap('n', 'gr', vim.lsp.buf.references)
        bufmap('n', 'gs', vim.lsp.buf.signature_help)
        bufmap("n", "gai", vim.lsp.buf.incoming_calls)
        bufmap("n", "gao", vim.lsp.buf.outgoing_calls)

        bufmap('n', 'gl', vim.diagnostic.open_float)
        bufmap('n', '[d', vim.diagnostic.goto_prev)
        bufmap('n', ']d', vim.diagnostic.goto_next)
      end
    })
  end,
}
