local builtin = require("telescope.builtin")

vim.keymap.set("n", "<Leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<Leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<Leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<Leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<Leader>fs", function()
	vim.cmd("Telescope aerial")
end, {})
vim.api.nvim_set_keymap(
	"n",
	"<leader>fr",
	'<cmd>lua require("telescope.builtin").lsp_references({jump_type = "never"})<CR>',
	{ noremap = true, silent = true }
)

require("telescope").setup({
	extensions = {
		aerial = {
			-- Display symbols as <root>.<parent>.<symbol>
			show_nesting = {
				["_"] = false, -- This key will be the default
				json = true, -- You can set the option for specific filetypes
				yaml = true,
			},
		},
	},
})
require("telescope").load_extension("aerial")
