vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap -- for conciseness

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- write file
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })

-- Open NetRW explorer
-- keymap.set("n", "<C-p>", ":Ex<CR>", { desc = "Open explorer" })

keymap.set("n", "<leader>O", "<cmd>Oil --float<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer

keymap.set("n", "<leader>j", ":bp<CR>", { desc = "Previous buffer" })
keymap.set("n", "<leader>k", ":bn<CR>", { desc = "Next buffer" })
keymap.set("n", "<leader>bd", ":bp | bd #<CR>", { desc = "Close buffer safely" })

-- Navigating splits
keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Diagnostic navigation
vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })

-- More specific navigation by severity
vim.keymap.set("n", "[e", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Go to previous [E]rror" })

vim.keymap.set("n", "]e", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Go to next [E]rror" })

vim.keymap.set("n", "[w", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
end, { desc = "Go to previous [W]arning" })

vim.keymap.set("n", "]w", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
end, { desc = "Go to next [W]arning" })

-- Show all diagnostics for current buffer
vim.keymap.set("n", "<leader>D", function()
	vim.diagnostic.setqflist({ bufnr = 0 })
end, { desc = "Show buffer [D]iagnostics in quickfix" })

-- Show all project diagnostics
vim.keymap.set("n", "<leader>da", vim.diagnostic.setqflist, { desc = "Show [A]ll diagnostics in quickfix" })

vim.keymap.set("n", "<leader>dc", vim.lsp.buf.code_action, { desc = "LSP: [D]iagnostic / [C]ode action" })
