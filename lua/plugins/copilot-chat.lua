return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = {
				enabled = false, -- Disabled by default
				auto_trigger = false,
				keymap = {
					accept = "<C-l>", -- Accept full suggestion
					accept_word = "<C-j>", -- Accept word
					accept_line = "<C-k>", -- Accept line
					next = "<C-]>", -- Next suggestion
					prev = "<C-[>", -- Previous suggestion
					dismiss = "<C-d>", -- Dismiss suggestion
				},
			},
			panel = { enabled = false },
		},
		config = function(_, opts)
			local copilot = require("copilot")
			copilot.setup(opts)

			-- Keymaps for enabling/disabling Copilot
			vim.keymap.set("n", "<leader>ce", function()
				require("copilot.suggestion").enable()
				print("Copilot enabled")
			end, { desc = "Enable Copilot" })

			vim.keymap.set("n", "<leader>cd", function()
				require("copilot.suggestion").disable()
				print("Copilot disabled")
			end, { desc = "Disable Copilot" })

			-- Manually trigger next suggestion
			vim.keymap.set("i", "<C-Space>", function()
				require("copilot.suggestion").next()
			end, { desc = "Copilot Next Suggestion" })
		end,
	},

	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- using Lua version for better control
			{ "nvim-lua/plenary.nvim" },
		},
		build = "make tiktoken",
		opts = {
			-- Your CopilotChat config
		},
	},
}
