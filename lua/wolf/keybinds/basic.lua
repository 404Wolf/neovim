local utils = require("wolf.keybinds.utils")
local opts = { noremap = true, silent = true }

-- Change leader to space
vim.g.mapleader = " "

-- Fix issue where aeriel binds to enter
utils.map("n", "<CR>", "", {})

-- Delete back to first nonspace
utils.map("n", "<leader>dbs", ':exe "normal! v<-left><left>S"<CR>', { noremap = true, silent = true })

-- Stay selected after indent
utils.map("v", "<", "<gv", { noremap = true })
utils.map("v", ">", ">gv", { noremap = true })

-- Select all
utils.map("n", "<Leader>aa", "ggVG", opts)

--  Folding
utils.map("n", "zt", "za", opts)
utils.map("n", "zc", ":lua vim.wo.foldlevel = vim.wo.foldlevel - 1<CR>", opts)
utils.map("n", "zo", ":lua vim.wo.foldlevel = vim.wo.foldlevel + 1<CR>", opts)

-- Maximize
utils.map("n", "<C-m>", ":only<CR>", opts)

-- Setup format
-- utils.map("n", "<Leader>pp", ':lua require("conform").format()<CR>:lua vim.lsp.buf.format()<CR>', opts)
utils.map("n", "<Leader>pp", ':lua require("conform").format()', opts)

-- Easy semicolon
utils.map("n", "<C-;>", ":.s/$/;/<CR>", opts)
--
-- New terminal buffer and enter it
utils.map("n", "<C-t>", ":enew<CR>:term<CR>", opts)

-- Save files and quit more easily
utils.map("n", "<Leader><Leader>", ":", { noremap = true, silent = false })
utils.map("n", "<C-w>", ":w<CR>", { noremap = true, silent = false })
utils.map("n", "<C-q>", ":q<CR>", { noremap = true, silent = false })

-- Change how scrolling up and down works to keep cursor centered on page
utils.map("n", "<C-d>", "<C-d>zz", opts)
utils.map("n", "<C-u>", "<C-u>zz", opts)
utils.map("n", "n", "nzz", opts)
utils.map("n", "N", "Nzz", opts)

-- Split window vertically
utils.map("n", "<Leader>sv", ":vsplit<CR>", opts)

-- Split window horizontally
utils.map("n", "<Leader>sh", ":split<CR>", opts)

-- Navigate splits easily using Ctrl + {h,j,k,l}
utils.map("n", "<C-j>", "<C-w>j", opts)
utils.map("n", "<C-k>", "<C-w>k", opts)
utils.map("n", "<C-l>", "<C-w>l", opts)
utils.map("n", "<C-h>", "<C-w>h", opts)

-- Resize splits more easily
local resize_amount = 8
utils.map("n", "<Leader>hh", ":vertical resize +" .. resize_amount .. "<CR>", opts)
utils.map("n", "<Leader>ll", ":vertical resize -" .. resize_amount .. "<CR>", opts)
utils.map("n", "<Leader>kk", ":resize -" .. resize_amount .. "<CR>", opts)
utils.map("n", "<Leader>jj", ":resize +" .. resize_amount .. "<CR>", opts)

-- Create a terminal in current pane
utils.map("n", "<Leader>tt", ":term<CR>", opts)
-- Create a terminal in a new pane
utils.map("n", "<Leader>tn", ":vsplit | term<CR>", opts)
-- Exit terminal mode (qt)
utils.map("t", "<Esc>", "<C-\\><C-n>", opts)
-- Control q in terminal mode is forced
utils.map("t", "<C-q>", "<C-\\><C-n>:q!<CR>", opts)

-- Layouts
vim.api.nvim_create_user_command("SplitTermLayout", TerminalOnBottomLayout, {})
utils.map("n", "<Leader>tl", ":SplitTermLayout<CR>", opts)
