local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Change leader to space
vim.g.mapleader = " "

-- Maximize
map('n', '<C-m>', ':only<CR>', opts)

-- Setup format
map('n', '<Leader>p', ':Format<CR>', opts)

-- Easy semicolon
map('n', '<C-;>', ':.s/$/;/', opts)

-- New terminal buffer and enter it
map('n', '<C-t>', ':enew<CR>:term<CR>', opts)

-- Save files and quit more easily
map('n', '<Leader><Leader>', ':', { noremap = true, silent = false })
map('n', '<C-w>', ":w<CR>", { noremap = true, silent = false })
map('n', '<C-q>', ":q<CR>", { noremap = true, silent = false })

-- Change how scrolling up and down works to keep cursor centered on page
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)
map('n', 'n', 'nzz', opts)
map('n', 'N', 'Nzz', opts)

-- Split window vertically
map('n', '<Leader>sv', ':vsplit<CR>', opts)

-- Split window horizontally
map('n', '<Leader>sh', ':split<CR>', opts)

-- Navigate splits easily using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Resize splits more easily
local resize_amount = 8
map('n', '<Leader>hh', ':vertical resize +' .. resize_amount .. '<CR>', opts)
map('n', '<Leader>ll', ':vertical resize -' .. resize_amount .. '<CR>', opts)
map('n', '<Leader>kk', ':resize -' .. resize_amount .. '<CR>', opts)
map('n', '<Leader>jj', ':resize +' .. resize_amount .. '<CR>', opts)

-- Create a terminal in current pane
map('n', '<Leader>tt', ':term<CR>', opts)
-- Create a terminal in a new pane
map('n', '<Leader>tn', ':vsplit | term<CR>', opts)
-- Exit terminal mode (qt)
map('t', '<Esc>', '<C-\\><C-n>', opts)
-- Control q in terminal mode is forced
map('t', '<C-q>', '<C-\\><C-n>:q!<CR>', opts)

-- Layouts
vim.api.nvim_create_user_command('SplitTermLayout', TerminalOnBottomLayout, {})
map('n', '<Leader>tl', ':SplitTermLayout<CR>', opts)
