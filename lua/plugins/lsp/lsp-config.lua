return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		-- Set up Mason
		require("mason").setup()

		-- Set up Mason LSPConfig
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
				"ts_ls", -- small fix: was "ts_ls"
				"html", -- for gohtml support
				-- optionally "templ" if you switch to .templ files
			},
			automatic_installation = true,
		})

		-- Capabilities (for nvim-cmp completion)
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- LSP servers
		local lspconfig = require("lspconfig")

		-- Lua
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
				},
			},
		})

		-- Python
		lspconfig.pyright.setup({ capabilities = capabilities })

		-- TypeScript
		lspconfig.ts_ls.setup({ capabilities = capabilities })

		-- HTML (will also work for gohtml)
		lspconfig.html.setup({
			capabilities = capabilities,
			filetypes = { "html", "gohtml" }, -- extend support to .gohtml
		})

		-- (Optional) templ LSP if you migrate to .templ files
		-- lspconfig.templ.setup({ capabilities = capabilities })

		-- Filetype detection for .gohtml
		vim.filetype.add({
			extension = {
				gohtml = "html",
			},
		})

		-- Keymaps for LSP
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
		vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })

		vim.keymap.set("n", "<leader>fa", function()
			vim.lsp.buf.code_action({
				context = { only = { "source.fixAll" } },
				apply = true,
			})
		end, { desc = "Fix all autofixable issues" })
	end,
}
