require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black", "isort" },
		javascript = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
		json = { "prettier" },
		yaml = { "prettier" },
		nix = { "nixfmt" },
		go = { "goimports", "gofmt" },
		bash = { "beautysh" },
		sh = { "beautysh" },
		rust = { "rustfmt" },
	},
})
