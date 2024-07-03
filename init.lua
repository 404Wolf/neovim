local xdg_data_home = vim.env.XDG_DATA_HOME or (vim.env.HOME .. "/.local/share")

-- Path to lazy.nvim in the XDG data directory
local lazypath = xdg_data_home .. "/lazy/lazy.nvim"

-- Clone lazy.nvim if it doesn't exist
if (vim.uv or vim.loop).fs_stat(lazypath) == nil then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end

-- Prepend the path to 'runtimepath'
vim.opt.rtp:prepend(lazypath)

-- Do plugin installations
require("lazy").setup({
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000, -- Ensure it loads first
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
	{
		"stevearc/aerial.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"kkoomen/vim-doge",
		config = function()
			if not vim.fn.glob("~/.local/share/nvim/lazy/vim-doge") then
				vim.fn.system({
					"git",
					"clone",
					"https://github.com/kkoomen/vim-doge",
					"~/.local/share/nvim/lazy/vim-doge",
				})

				vim.cmd("call doge#install()")
			end
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	{
		"smoka7/hop.nvim",
		version = "*",
		opts = {
			keys = "etovxqpdygfblzhckisuran",
		},
	},
	"lewis6991/gitsigns.nvim",
	"github/copilot.vim",
	"chentoast/marks.nvim",
	"pocco81/auto-save.nvim",
	"numToStr/Comment.nvim",
	"xiyaowong/virtcolumn.nvim",
	"stevearc/conform.nvim",
	{
		"neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
		lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
		dependencies = {
			{ "ms-jpq/coq_nvim", branch = "coq" },
			{ "ms-jpq/coq.artifacts", branch = "artifacts" },
			{ "ms-jpq/coq.thirdparty", branch = "3p" },
		},
		init = function()
			vim.g.coq_settings = {
				auto_start = "shut-up", -- if you want to start COQ at startup
				keymap = {
					jump_to_mark = "",
				},
			}
		end,
		config = function() end,
	},
	"ms-jpq/coq.thirdparty",
	{
		{
			"romgrk/barbar.nvim",
			dependencies = {
				"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
				"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
			},
			version = "^1.0.0", -- optional: only update when a new 1.x version is released
		},
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
})

-- Require other packages
require("wolf")
