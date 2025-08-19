return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
	dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		local luasnip = require("luasnip")

		-- Load snippets
		require("luasnip.loaders.from_vscode").lazy_load() -- friendly-snippets
		require("luasnip.loaders.from_vscode").lazy_load({
			paths = { vim.fn.stdpath("config") .. "/snips" }, -- your custom snippets
		})

		-- Core settings
		luasnip.config.set_config({
			history = false,
			updateevents = "TextChanged,TextChangedI",
			enable_autosnippets = true,
		})

		-- 🔑 Keymaps (use Ctrl-j / Ctrl-k instead of Tab to avoid conflicts)
		vim.keymap.set({ "i", "s" }, "<C-j>", function()
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			end
		end, { silent = true, desc = "LuaSnip expand/jump" })

		vim.keymap.set({ "i", "s" }, "<C-h>", function()
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { silent = true, desc = "LuaSnip jump back" })
	end,
}
