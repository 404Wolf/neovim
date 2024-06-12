require('ranger-nvim').setup({
  replace_netrw = false,
})

vim.api.nvim_set_keymap("n", "<C-r>", "", {
  noremap = true,
  callback = function()
    require("ranger-nvim").open(true)
  end,
})

