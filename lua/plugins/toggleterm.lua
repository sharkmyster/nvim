return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			-- always open terminals as vertical splits
			direction = "vertical",
			size = 80, -- width in columns for vertical splits
			shade_terminals = true, -- dim background for contrast
			start_in_insert = true, -- jump straight into insert mode
			persist_size = true, -- remember size of terminal between sessions
		})

		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			-- leave terminal mode with Esc
			vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)
			-- optional: make navigation consistent with normal splits
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

		-- keymaps
		local map = vim.keymap.set
		map("n", "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })

		-- optional: quick toggles for different layouts
		map("n", "<leader>tv", function()
			vim.cmd("ToggleTerm direction=vertical")
		end, { desc = "Vertical terminal" })

		map("n", "<leader>th", function()
			vim.cmd("ToggleTerm direction=horizontal")
		end, { desc = "Horizontal terminal" })

		map("n", "<leader>tf", function()
			vim.cmd("ToggleTerm direction=float")
		end, { desc = "Floating terminal" })

		map("n", "<leader>ta", "<cmd>ToggleTermToggleAll<cr>", { desc = "Toggle all terminals" })
	end,
}
