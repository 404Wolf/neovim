local lspconfig = require('lspconfig')

lspconfig.basedpyright.setup {
  autostart = true,
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.lua_ls.setup {
  autostart = true,
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT'
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
        }
      }
    })
  end,
  settings = {
    Lua = {}
  }
}

lspconfig.rust_analyzer.setup({
  autostart = true,
})

lspconfig.nixd.setup({
  autostart = true,
})

lspconfig.bashls.setup({
  autostart = true,
})


lspconfig.jsonls.setup({
  autostart = true,
})

lspconfig.yamlls.setup({
  autostart = true,
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
      },
    },
  }
})

lspconfig.ltex.setup({
  autostart = true,
})

-- VSCode provided language servers

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup({
  autostart = true,
  capabilities = capabilities,
})

lspconfig.jsonls.setup({
  autostart = true,
  capabilities = capabilities,
})
