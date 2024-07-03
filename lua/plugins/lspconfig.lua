local lspconfig = require("lspconfig")
local coq = require("coq")

lspconfig.basedpyright.setup({
	autostart = true,
})
lspconfig.basedpyright.setup(coq.lsp_ensure_capabilities())

lspconfig.lua_ls.setup({
	autostart = true,
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
			return
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
		})
	end,
	settings = {
		Lua = {},
	},
})
lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities())

lspconfig.rust_analyzer.setup({
	autostart = true,
})
lspconfig.rust_analyzer.setup(coq.lsp_ensure_capabilities())

lspconfig.nixd.setup({
	autostart = true,
})
lspconfig.nixd.setup(coq.lsp_ensure_capabilities())

lspconfig.bashls.setup({
	autostart = true,
})
lspconfig.bashls.setup(coq.lsp_ensure_capabilities())

lspconfig.jsonls.setup({
	autostart = true,
})
lspconfig.jsonls.setup(coq.lsp_ensure_capabilities())

lspconfig.yamlls.setup({
	autostart = true,
	settings = {
		yaml = {
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
			},
		},
	},
})
lspconfig.yamlls.setup(coq.lsp_ensure_capabilities())
lspconfig.yamlls.setup(coq.lsp_ensure_capabilities())

lspconfig.ltex.setup({
	autostart = true,
})
lspconfig.ltex.setup(coq.lsp_ensure_capabilities())

-- VSCode provided language servers

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup({
	autostart = true,
	capabilities = capabilities,
})
lspconfig.html.setup(coq.lsp_ensure_capabilities())

lspconfig.jsonls.setup({
	autostart = true,
	capabilities = capabilities,
})
lspconfig.jsonls.setup(coq.lsp_ensure_capabilities())

lspconfig.taplo.setup({
	autostart = true,
})
lspconfig.taplo.setup(coq.lsp_ensure_capabilities())
