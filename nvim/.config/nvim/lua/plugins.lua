vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-telescope/telescope-fzy-native.nvim" },
			{ "kyazdani42/nvim-web-devicons" },
			{ "nvim-telescope/telescope-file-browser.nvim" },
			{ "nvim-telescope/telescope-dap.nvim" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
	})

  --use {
--	'nvim-treesitter/nvim-treesitter',
--	run = ':TSUpdate'
 -- }

  --use 'nvim-treesitter/playground'


 	-- LSP
	use({
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"jose-elias-alvarez/null-ls.nvim",
        "williamboman/nvim-lsp-installer",
	})

	-- Completion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-git",
			"rcarriga/cmp-dap",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind-nvim",
			"L3MON4D3/LuaSnip",
			"windwp/nvim-autopairs",
		},
	})

 use 'lewis6991/gitsigns.nvim'

 use 'tpope/vim-fugitive'
 use 'tpope/vim-surround'
 use 'tpope/vim-commentary'

-- themes
 use "EdenEast/nightfox.nvim"
 use { 'kartikp10/noctis.nvim', requires = { 'rktjmp/lush.nvim' }}
 use 'wuelnerdotexe/vim-enfocado'
 use 'folke/tokyonight.nvim'

-- statusbar
use 'feline-nvim/feline.nvim'
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}

-- icons
use 'kyazdani42/nvim-web-devicons'

-- neotree
use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
}

use 'anuvyklack/hydra.nvim'

use({
    "ThePrimeagen/harpoon",
    requires = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
    },
})


-- jupyter notebooks
use 'luk400/vim-jukit'

-- LaTex
use 'lervag/vimtex'

--TodoCooments
use {
  "folke/todo-comments.nvim",
  requires = "nvim-lua/plenary.nvim",
}

--vista
use 'liuchengxu/vista.vim'

-- autosave
use "Pocco81/auto-save.nvim"

-- cheatsheet

use {
  'sudormrfbin/cheatsheet.nvim',

  requires = {
    {'nvim-telescope/telescope.nvim'},
    {'nvim-lua/popup.nvim'},
    {'nvim-lua/plenary.nvim'},
  }
}

-- comments
use 'numToStr/Comment.nvim'

-- TODO: pendiente saber uso

use({
	"mfussenegger/nvim-dap",
	requires = {
		"theHamsta/nvim-dap-virtual-text",
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
	},
})

--minimap 
use "ziontee113/neo-minimap"

-- treesitter
use {
    'nvim-treesitter/playground',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    cmd = 'TSPlaygroundToggle',
}

end
)


