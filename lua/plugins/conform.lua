vim.lsp.buf.format({
  filter = function(client)
    return client.name ~= "tsserver"
  end,
})

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd" },
    json = { "prettierd" },
    yaml = { "prettierd" },
    nix = { "nixfmt" },
    go = { "goimports", "gofmt" },
    bash = { "beautysh" },
    sh = { "beautysh" },
    rust = { "rustfmt" },
  },
})
