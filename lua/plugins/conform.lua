vim.lsp.buf.format({
	filter = function(client)
		return client.name ~= "tsserver"
	end,
})

require("conform").setup({
	formatters_by_ft = {
    javascript = { "prettierd", "prettier", stop_after_first = true },
    typescript = { "prettierd", "prettier", stop_after_first = true },
		lua = { "stylua" },
		css = { "prettierd" },
		json = { "prettierd" },
		yaml = { "prettierd" },
		nix = { "alejandra" },
		go = { "goimports", "gofmt" },
		bash = { "beautysh" },
		sh = { "beautysh" },
		rust = { "rustfmt" },
		tex = { "latexindent" },
	},
})

vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })
