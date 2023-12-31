local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	'wbthomason/packer.nvim',
	-- My plugins ==============================
	-- Themes ==================================
	"ellisonleao/gruvbox.nvim",                     -- theme
	{ 'rose-pine/neovim',      name = 'rose-pine' }, -- theme

	'zah/nim.vim',                                  -- Nim syntax highlighter only
	'nvim-lualine/lualine.nvim',                    -- status line
	'NvChad/nvim-colorizer.lua',                    -- Colorize: give color to hex codes

	-- Start page
	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require 'alpha'.setup(require 'alpha.themes.startify'.config)
		end
	},

	-- Comment
	{ 'numToStr/Comment.nvim', opts = {} },

	-- Which Key: show keybidings menu
	{
		'folke/which-key.nvim',
		opts = {
			window = {
				position = "top",    -- bottom, top
				margin = { 0, 0, 0, 2 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
			},
		}
	},

	-- complete ([{'"
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {} -- this is equalent to setup({}) function
	},

	-- TreeSitter
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects', },
		build = ':TSUpdate',
	},

	-- Telescope
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.3',
		dependencies = { { 'nvim-lua/plenary.nvim' } }
	},


	-- LSP
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'williamboman/mason.nvim', config = true },
			'williamboman/mason-lspconfig.nvim',
			{ 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },
			'folke/neodev.nvim', },
	},

	-- Completion
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lsp', 'rafamadriz/friendly-snippets', },
	},
	'neovim/nvim-lspconfig',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',

	-- Toggle term
	{
		{
			'akinsho/toggleterm.nvim',
			version = "*",
			opts = {
				open_mapping = [[<c-_>]],
				direction = "float",
			},
		}
	},


}

require("lazy").setup(plugins, opt)
require('colorizer').setup {}
