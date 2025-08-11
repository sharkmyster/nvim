-- gitsigns setup
return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			numhl = false,
			signcolumn = true,
			current_line_blame = true,
			current_line_blame_opts = {
				delay = 0,
			},
		})
	end,
}
