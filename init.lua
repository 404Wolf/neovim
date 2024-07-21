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
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
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
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		cmd = "Telescope",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	"lukas-reineke/indent-blankline.nvim",
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
	"lewis6991/gitsigns.nvim",
	"chentoast/marks.nvim",
	"pocco81/auto-save.nvim",
	"numToStr/Comment.nvim",
	"xiyaowong/virtcolumn.nvim",
	{
		"jonahgoldwastaken/copilot-status.nvim",
		dependencies = { "zbirenbaum/copilot.lua" },
		lazy = true,
		event = "BufReadPost",
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({})
		end,
	},
	"onsails/lspkind.nvim",
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				-- Customize or remove this keymap to your liking
				"<leader>f",
				function()
					require("conform").format({ async = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		-- This will provide type hinting with LuaLS
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			-- Define your formatters
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
			},
			-- Set default options
			default_format_opts = {
				lsp_format = "fallback",
			},
			-- Set up format-on-save
			format_on_save = { timeout_ms = 500 },
			-- Customize formatters
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" },
				},
			},
		},
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
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
			}
		end,
		config = function() end,
	},
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
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-tree.lua",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
	{
		"luckasRanarison/tailwind-tools.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {}, -- your configuration
		t = { "typescript", "typescriptreact", "javascript" },
	},
	"maxmellon/vim-jsx-pretty",
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
		t = { "typescript", "typescriptreact", "javascript" },
	},
	{
		"ms-jpq/chadtree",
		build = ":CHADdeps",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
		},
	},
	"tpope/vim-fugitive",
})

-- Require other packages
require("wolf")
vim.cmd(":AerialOpen")

