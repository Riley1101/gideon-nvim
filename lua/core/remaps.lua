-- leader key mapping
vim.g.mapleader = " ";

-- Open netrw 
vim.keymap.set("n","<leader>pv",vim.cmd.Ex);

-- move up and down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- half page movement
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- jk escape 
vim.keymap.set("i", "jk", "<ESC>")
