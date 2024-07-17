vim.g.coq_settings = {
	auto_start = "shut-up", -- if you want to start COQ at startup
	keymap = {
		jump_to_mark = "asdfghjkl",
	},
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
