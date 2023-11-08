vim.g.mapleader = " "
local keymap = vim.keymap
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Windows movement
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- Cursor movement
keymap.set("i", "<C-h>", "<Left>")
keymap.set("i", "<C-j>", "<Down>")
keymap.set("i", "<C-k>", "<Up>")
keymap.set("i", "<C-l>", "<Right>")
keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move lines down
keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move lines up

-- Search config
keymap.set("n", "n", "nzz")

-- Yank lines
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

-- Interact with files
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Terminal
keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Remove annoying stuff
keymap.set("n", "Q", "<nop>")
keymap.set("n", "q", "<nop>")

-- Control smoothness
keymap.set("n", ";", ":")
