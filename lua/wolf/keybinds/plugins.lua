opts = { noremap = true, silent = true }

-- Aerieal
vim.api.nvim_set_keymap("n", "<C-m>", "<cmd>AerialToggle!<CR>", {})

-- Autosave
vim.api.nvim_set_keymap("n", "<Leader>as", ":ASToggle<CR>", {})

-- Comments
vim.api.nvim_set_keymap('n', '<C-/>', 'gc', opts)

-- Docstrings
vim.api.nvim_set_keymap('n', '<C-j>', ':DogeGenerate<CR>', opts)

-- Neotree
vim.api.nvim_set_keymap('n', '<C-n>', ':Neotree toggle<CR>', opts)

-- Hop
vim.api.nvim_set_keymap('n', '<Leader>hw', ':HopWord<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>hc', ':HopCamelCase<CR>' , opts)
vim.api.nvim_set_keymap('n', '<Leader>hl', ':HopLine<CR>', opts)

-- Harpoon
-- "<CMD>lua require("harpoon.mark").add_file()"
