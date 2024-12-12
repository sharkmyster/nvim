vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- write file
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })


keymap.set("n", "<leader>j", ":bp<CR>", { desc = "Previous buffer" })
keymap.set("n", "<leader>k", ":bn<CR>", { desc = "Next buffer" })
