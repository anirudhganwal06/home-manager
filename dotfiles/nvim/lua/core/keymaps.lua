vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<esc>")                                -- INSERT mode to NORMAL mode
keymap.set("i", "kj", "<esc>")                                -- INSERT mode to NORMAL mode
keymap.set("t", "jk", "<C-\\><C-n>")                          -- TERMINAL mode to NORMAL mode
keymap.set("t", "kj", "<C-\\><C-n>")                          -- TERMINAL mode to NORMAL mode

keymap.set("n", "<tab>", "<c-^>")                             -- Switch buffer with the previous buffer
keymap.set("n", "<leader>o", "o<esc>")                        -- Insert new line after and stay in NORMAL mode
keymap.set("n", "<leader>O", "O<esc>")                        -- Insert new line before and stay in NORMAL mode
keymap.set("n", "<leader>h", ":wincmd h<cr>")                 -- Focus on left pane
keymap.set("n", "<leader>j", ":wincmd j<cr>")                 -- Focus on below pane
keymap.set("n", "<leader>k", ":wincmd k<cr>")                 -- Focus on upper pane
keymap.set("n", "<leader>l", ":wincmd l<cr>")                 -- Focus on right pane
keymap.set("n", "<leader>D", ":split<cr>")                    -- Split horizontally
keymap.set("n", "<leader>d", ":vsplit<cr>")                   -- Split vertically
keymap.set("n", "<leader>T", ":split | terminal<cr>8<C-w>_i") -- Open terminal in horizontal split
keymap.set("n", "<leader>t", ":vsplit | terminal<cr>i")       -- Open terminal in vertical split
keymap.set("n", "<leader>s", ":!")                            -- Start typing shell command
