return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "lua", "python", "javascript", "go", "typescript", "tsx", "bash", "css", "html" },
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-0>", -- Start selection
					node_incremental = "<C-0>", -- Expand to parent
					scope_incremental = "<C-9>", -- Expand to scope
					node_decremental = "<BS>", -- Shrink
				},
			},
		})
	end,
}
