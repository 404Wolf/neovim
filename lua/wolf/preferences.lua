-- Aesthetic
vim.cmd('colorscheme onedark_dark')

-- Tabs
local tab_amount = 2
vim.o.shiftwidth = tab_amount
vim.o.tabstop = tab_amount
vim.o.expandtab = true

-- Line numbering
vim.o.relativenumber = true
vim.o.number = true

-- Rular at 90 characters
vim.o.colorcolumn = "79,120"

-- Use dots for spaces
vim.opt.list = true
vim.opt.listchars:append("space:·")

---- Custom highlighting
vim.cmd('highlight Visual guibg=#0d2927')

-- Enable the LSP
-- vim.cmd('LspStart')
