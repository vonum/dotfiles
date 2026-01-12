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
			dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
		},
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

		local handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
		}

		vim.lsp.config.gopls = {
			capabilities = lsp_capabilities,
			handlers = handlers,
		}
		vim.lsp.enable("gopls")

		vim.lsp.config.pyright = {
			capabilities = lsp_capabilities,
			handlers = handlers,
			-- Expect .venv to be in project
			settings = {
				python = {
					pythonPath = vim.fn.getcwd() .. "/.venv/bin/python",
				},
			},
		}
		vim.lsp.enable("pyright")

		vim.lsp.config.rust_analyzer = {
			capabilities = lsp_capabilities,
			handlers = handlers,
		}
		vim.lsp.enable("rust_analyzer")

		vim.lsp.config.elixirls = {
			capabilities = lsp_capabilities,
			handlers = handlers,
		}
		vim.lsp.enable("elixirls")

		vim.lsp.config.solc = {
			capabilities = lsp_capabilities,
			handlers = handlers,
		}
		vim.lsp.enable("solc")

		vim.lsp.config.rubocop = {
			capabilities = lsp_capabilities,
			handlers = handlers,
		}
		vim.lsp.enable("rubocop")

		vim.lsp.config.ts_ls = {
			capabilities = lsp_capabilities,
			handlers = handlers,
		}
		vim.lsp.enable("ts_ls")

		vim.lsp.config.marksman = {
			capabilities = lsp_capabilities,
			handlers = handlers,
		}
		vim.lsp.enable("marksman")

		vim.lsp.config.terraformls = {
			capabilities = lsp_capabilities,
			handlers = handlers,
			init_options = {
				terraform = {
					path = "/opt/homebrew/bin/terraform",
				},
			},
		}
		vim.lsp.enable("terraformls")

		vim.lsp.config.lua_ls = {
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
		}
		vim.lsp.enable("lua_ls")

		vim.lsp.config.yamlls = {
			capabilities = lsp_capabilities,
			handlers = handlers,
			settings = {
				yaml = {
					schemas = {
						kubernetes = "*.yaml",
						["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
						["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
						["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
					},
				},
			},
		}
		vim.lsp.enable("yamlls")

		-- local custom_map = function(type, key, value)
		--   -- vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true})
		--   vim.keymap.set(type, key, value, { noremap = true, silent = true })
		-- end
		-- custom_map("n", "<leader>=", "<cmd> lua vim.lsp.buf.formatting()<cr>")

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function()
				local bufmap = function(mode, lhs, rhs)
					local opts = { buffer = true }
					vim.keymap.set(mode, lhs, rhs, opts)
				end

				bufmap("n", "K", vim.lsp.buf.hover)
				bufmap("n", "gd", vim.lsp.buf.definition)
				bufmap("n", "gD", vim.lsp.buf.declaration)
				bufmap("n", "gi", vim.lsp.buf.implementation)
				bufmap("n", "gt", vim.lsp.buf.type_definition)

				bufmap("n", "gr", vim.lsp.buf.references)
				bufmap("n", "gs", vim.lsp.buf.signature_help)
				bufmap("n", "gai", vim.lsp.buf.incoming_calls)
				bufmap("n", "gao", vim.lsp.buf.outgoing_calls)

				bufmap("n", "gl", vim.diagnostic.open_float)
				bufmap("n", "[d", vim.diagnostic.goto_prev)
				bufmap("n", "]d", vim.diagnostic.goto_next)
			end,
		})
	end,
}
