local utils = require("wolf.keybinds.utils")
local opts = { noremap = true, silent = true }
opts = { noremap = true, silent = true }

-- Aerieal
utils.map("n", "<C-m>", "<cmd>AerialToggle!<CR>", {})

-- Autosave
utils.map("n", "<Leader>as", ":ASToggle<CR>", {})

-- Comments
utils.map("n", "<C-/>", "gc", opts)

-- Docstrings
utils.map("n", "<C-j>", ":DogeGenerate<CR>", opts)

-- Neotree
utils.map("n", "<C-n>", ":Neotree toggle<CR>", opts)

-- Hop
utils.map("n", "<Leader>hw", ":HopWord<CR>", opts)
utils.map("n", "<Leader>hc", ":HopCamelCase<CR>", opts)
utils.map("n", "<Leader>hl", ":HopLine<CR>", opts)

-- LSP
utils.map("n", "grn", ":lua vim.lsp.buf.rename()<CR>", opts)
utils.map("n", "gra", ":lua vim.lsp.buf.code_action()<CR>", opts)
utils.map("n", "grr", ":lua vim.lsp.buf.references()<CR>", opts)
utils.map("i", "<C-S>", ":lua vim.lsp.buf.signature_help()<CR>", opts)
