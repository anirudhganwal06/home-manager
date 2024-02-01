vim.g.mapleader = " "

local keymap = vim.keymap
keymap.set("i", "jk", "<esc>") -- INSERT mode to NORMAL mode
keymap.set("i", "kj", "<esc>") -- INSERT mode to NORMAL mode
keymap.set("c", "jk", "<esc>") -- INSERT mode to NORMAL mode
keymap.set("c", "kj", "<esc>") -- INSERT mode to NORMAL mode
keymap.set("t", "jk", "<C-\\><C-n>") -- TERMINAL mode to NORMAL mode
keymap.set("t", "kj", "<C-\\><C-n>") -- TERMINAL mode to NORMAL mode

keymap.set("n", "<tab>", "<c-^>") -- Switch buffer with the previous buffer
keymap.set("n", "<leader>o", "o<esc>") -- Insert new line after and stay in NORMAL mode
keymap.set("n", "<leader>O", "O<esc>") -- Insert new line before and stay in NORMAL mode
keymap.set("n", "<leader>h", ":wincmd h<cr>") -- Focus on left pane
keymap.set("n", "<leader>j", ":wincmd j<cr>") -- Focus on below pane
keymap.set("n", "<leader>k", ":wincmd k<cr>") -- Focus on upper pane
keymap.set("n", "<leader>l", ":wincmd l<cr>") -- Focus on right pane
keymap.set("n", "<leader>D", ":split<cr>") -- Split horizontally
keymap.set("n", "<leader>d", ":vsplit<cr>") -- Split vertically
keymap.set("n", "<leader>T", ":split | terminal<cr>12<C-w>_i") -- Open terminal in horizontal split
keymap.set("n", "<leader>t", ":vsplit | terminal<cr>i") -- Open terminal in vertical split
keymap.set("n", "<leader>s", ":!") -- Start typing shell command
keymap.set("n", ",", "<C-d>zz") -- Bring cursor to center
keymap.set("n", ";", "<C-u>zz") -- Bring cursor to center
keymap.set("n", "n", "nzz") -- Bring cursor to center
keymap.set("n", "N", "Nzz") -- Bring cursor to center
keymap.set("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
keymap.set("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)
keymap.set("n", "<leader><cr>", ":tab split<cr>") -- Open in a new tab fullscreen
keymap.set("n", "gx", ":!open <c-r><c-a><cr>", { silent = true }) -- Open a link
keymap.set("n", "<esc>", ":nohl<cr><esc>", { silent = true }) -- Also remove highlight when esc
keymap.set("v", "<leader>fr", "y:%s/\\V<C-r>=v:lua.EscapeText()<cr>//gc<left><left><left>", { noremap = true }) -- Find & Replace ANYTHING
keymap.set("v", "*", "y/\\V<C-r>=v:lua.EscapeText()<cr><cr>", { noremap = true }) -- Find ANYTHING
