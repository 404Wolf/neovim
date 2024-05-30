local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Change leader to space
vim.g.mapleader = " "

-- Setup format
map('n', '<Leader>p', ':Format<CR>', opts)

-- Completely quit neovim with control q
map('n', '<C-q>', ':qa!<CR>', opts)

-- Save files and quit more easily
map('n', '<Leader><Leader>', ':', { noremap = true, silent = false })
map('n', '<Leader>ww', ":w<CR>", { noremap = true, silent = false })

-- Resource the config
vim.keymap.set("n", "<leader>so", vim.cmd.source)

-- Change how scrolling up and down works to keep cursor centered on page
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)

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
resize_amount = 5
map('n', '<Leader>hh', ':vertical resize -' .. resize_amount .. '<CR>', opts) 
map('n', '<Leader>ll', ':vertical resize +' .. resize_amount .. '<CR>', opts)
map('n', '<Leader>kk', ':resize +' .. resize_amount .. '<CR>', opts) 
map('n', '<Leader>jj', ':resize -' .. resize_amount .. '<CR>', opts) 

-- Close the current view
map('n', '<C-w>', ':q<CR>', opts)

