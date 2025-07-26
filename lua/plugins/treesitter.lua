return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "lua", "python", "javascript", "go", "typescript", "tsx", "bash", "css", "html" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
