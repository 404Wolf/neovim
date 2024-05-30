vim.g.mapleader = " "
vim.keymap.set("n", "<leader>eq", vim.cmd.Ex)
vim.keymap.set("n", "<leader>ew", function() vim.cmd.write() vim.cmd.Ex() end)

