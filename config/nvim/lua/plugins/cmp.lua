return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      dependencies = {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end
      }
    },
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-calc",
    "saadparwaiz1/cmp_luasnip"
  },
  config = function()
    vim.opt.completeopt = { "menu", "menuone", "noselect" }

    local cmp = require("cmp")
    local luasnip = require("luasnip")

    local select_opts = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },
      sources = {
        { name = "luasnip",  max_item_count = 7, keyword_length = 2 },
        { name = "nvim_lsp", max_item_count = 7, keyword_length = 2 },
        { name = "buffer",   max_item_count = 5, keyword_length = 2 },
        { name = "path",     max_item_count = 3, keyword_length = 2 },
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
      },
      formatting = {
        fields = { "menu", "abbr", "kind" },
        format = function(entry, item)
          local menu_icon = {
            luasnip = "⋗",
            nvim_lsp = "λ",
            buffer = "Ω",
            path = "🖫",
          }

          item.menu = menu_icon[entry.source.name]
          return item
        end,
      },
      mapping = {
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),

        -- scroll docs window
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),

        ["<Tab>"] = cmp.mapping(function(fallback)
          local col = vim.fn.col(".") - 1

          if cmp.visible() then
            cmp.select_next_item(select_opts)
          else
            fallback()
          end

          -- if cmp.visible() then
          --   cmp.select_next_item(select_opts)
          -- elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
          --   fallback()
          -- else
          --   cmp.complete()
          -- end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item(select_opts)
          else
            fallback()
          end
        end, { "i", "s" }),
      },
    })
  end
}
