vim.g.coq_settings = {
	xdg = true,
	clients = {
		lsp = {
			always_on_top = {},
		},
	},
}

require("coq_3p")({
	{ src = "copilot", short_name = "COP", accept_key = "<c-f>" },
})
