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
utils.map("n", "grs", ":lua vim.lsp.buf.signature_help()<CR>", opts)

-- Barbar

-- Move to previous/next
utils.map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
utils.map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
utils.map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
utils.map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
utils.map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
utils.map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
utils.map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
utils.map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
utils.map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
utils.map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
utils.map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
utils.map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
utils.map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
utils.map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
utils.map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
utils.map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Magic buffer-picking mode
utils.map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
utils.map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
utils.map('n', '<Space>bs', '<Cmd>BufferOrderByName<CR>', opts)
