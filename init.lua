local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Color themes
Plug('olimorris/onedarkpro.nvim')
Plug('catppuccin/nvim')

-- UI Goodies
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-neo-tree/neo-tree.nvim')
Plug('nvim-tree/nvim-web-devicons')

-- Telescope
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')

-- LSP stuff
Plug('nvim-treesitter/nvim-treesitter', {['do'] = function() vim.cmd(':TSUpdate') end })

vim.call('plug#end')

-- Require other packages
require("wolf")

