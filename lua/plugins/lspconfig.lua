local nvim_lsp = require("lspconfig")
nvim_lsp.nixd.setup({
   cmd = { "nixd" },
   settings = {
     nixd = {
       nixpkgs = {
         expr = "import <nixpkgs> { }",
       },
       formatting = {
         command = { "nixpkgs-fmt" },
       },
       options = {
         nixos = {
           expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.k-on.options',
         },
         home_manager = {
           expr = '(builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations."ruixi@k-on".options',
         },
       },
     },
   },
})
nvim_lsp.tsserver.setup({})
nvim_lsp.pyright.setup({})
nvim_lsp.rust_analyzer.setup({})
nvim_lsp.java_language_server.setup({})
nvim_lsp.cssls.setup({})
nvim_lsp.marksman.setup({})
nvim_lsp.typst_lsp.setup({})
nvim_lsp.ltex.setup({})
nvim_lsp.lua_ls.setup({})

