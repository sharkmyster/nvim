return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"Hoffs/omnisharp-extended-lsp.nvim",
	},
	config = function()
		-- Set up Mason
		-- Initializes mason.nvim
		-- Mason is the plugin that manages installing external tools (LSP servers, formatters, debuggers) right inside Neovim.
		-- This line makes sure Mason is ready to install/track tools in its registry.
		require("mason").setup()

		-- Set up Mason LSPConfig
		-- Connects Mason to nvim-lspconfig
		-- Without this, Mason just installs binaries but doesn’t tell Neovim about them.
		-- With this line, you can:
		-- Use ensure_installed = {...} to auto-install specific LSP servers.
		-- Optionally let it auto-call lspconfig[server].setup({}) for you (if you don’t want to configure manually).
		-- If you call it with no arguments (like you did here), Mason just wires itself up so :Mason knows about LSP servers,
		-- but doesn’t enforce any ensure_installed or auto-setup logic.


		require("mason-lspconfig").setup({
			automatic_installation = false,
			handlers = {}, -- disable auto lspconfig setup to avoid double attach
		})

		-- Capabilities (for nvim-cmp completion
		-- Creates a capabilities object that tells LSP servers which features your client (Neovim) supports.
		-- In this case, it extends the default Neovim LSP capabilities with extra completion features provided by nvim-cmp (like snippet support, completion item resolution, etc.).
		-- You then pass this capabilities object into each lspconfig.<server>.setup({ capabilities = capabilities }) call so that autocompletion works properly.
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- What it does: Loads the nvim-lspconfig  module.
		-- This gives you access to lspconfig.<server>.setup({ ... }), which is the API
		-- for configuring each LSP server (like ts_ls, pyright, etc.).
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

		-- TypeScript
		lspconfig.ts_ls.setup({ capabilities = capabilities, autostart = false })

		-- HTML (will also work for gohtml)
		lspconfig.html.setup({
			capabilities = capabilities,
			filetypes = { "html", "gohtml" }, -- extend support to .gohtml

		})

		-- C# / .NET (OmniSharp)
		-- lspconfig.omnisharp.setup({
		-- 	capabilities = capabilities,
		-- 	cmd = { "omnisharp" }, -- Mason puts omnisharp in PATH
		-- 	enable_roslyn_analyzers = true,
		-- 	organize_imports_on_format = true,
		-- 	enable_import_completion = true,

		-- 	handlers = {
		-- 		["textDocument/definition"] = require("omnisharp_extended").definition_handler,
		-- 		["textDocument/typeDefinition"] = require("omnisharp_extended").type_definition_handler,
		-- 		["textDocument/references"] = require("omnisharp_extended").references_handler,
		-- 		["textDocument/implementation"] = require("omnisharp_extended").implementation_handler,
		-- 	},
		-- })

		-- (Optional) templ LSP if you migrate to .templ files
		-- lspconfig.templ.setup({ capabilities = capabilities })

		-- Filetype detection for .gohtml
		vim.filetype.add({
			extension = {
				gohtml = "html",
			},
		})

		-- 🔑 Set keymaps when an LSP attaches
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				local opts = { buffer = bufnr, silent = true }

				if client.name == "omnisharp" then
					vim.keymap.set("n", "gd", require("omnisharp_extended").telescope_lsp_definitions, opts)
				else
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				end

				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

				vim.keymap.set("n", "<leader>fa", function()
					vim.lsp.buf.code_action({
						context = { only = { "source.fixAll" } },
						apply = true,
					})
				end, opts)

				-- Optional: diagnostics navigation
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
			end,
		})
	end,
}
