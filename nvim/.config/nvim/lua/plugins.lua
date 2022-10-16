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
  use {
	'nvim-telescope/telescope.nvim', tag = '0.1.0',
	requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
	'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate'
  }

  use 'nvim-treesitter/playground'
  use {
	  "williamboman/nvim-lsp-installer",
	  'neovim/nvim-lspconfig',
  }

  use {
        'hrsh7th/cmp-nvim-lsp',
        requires = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/nvim-cmp',
        }
  }

 use 'lewis6991/gitsigns.nvim'

 use 'tpope/vim-fugitive'
 use 'tpope/vim-surround'
 use 'tpope/vim-commentary'

-- themes
 use "EdenEast/nightfox.nvim"
 use { 'kartikp10/noctis.nvim', requires = { 'rktjmp/lush.nvim' }} 

-- statusbar
use 'feline-nvim/feline.nvim'

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

-- LuaSnip
use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})

end
)


