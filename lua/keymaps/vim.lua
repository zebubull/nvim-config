vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", '"_x')

keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

keymap.set("n", "<A-h>", "<C-w>>")
keymap.set("n", "<A-k>", "<C-w>+")
keymap.set("n", "<A-j>", "<C-w>-")
keymap.set("n", "<A-l>", "<C-w><")

keymap.set("n", "<tab>", "")

keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", "<cmd>close<CR>")
keymap.set("n", "<leader>bd", "<cmd>enew<bar>bd #<CR>")

keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>")
keymap.set("n", "<leader>tt", "<cmd>tabnew term | terminal<CR>")
keymap.set("n", "<leader>tx", "<cmd>tabc<CR>")
keymap.set("n", "<leader>to", "<cmd>tabo<CR>")
keymap.set("n", "<S-h>", "<cmd>tabn<CR>")
keymap.set("n", "<S-l>", "<cmd>tabp<CR>")

keymap.set("n", "<C-i>", "<C-o>")
keymap.set("n", "<C-o>", "<C-i>")

keymap.set("t", "<C-\\>", "<c-\\><c-n>")
