return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-telescope/telescope-fzy-native.nvim" },
			{ "kyazdani42/nvim-web-devicons" },
			{ "nvim-telescope/telescope-file-browser.nvim" },
			{ "nvim-telescope/telescope-dap.nvim" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		}
	},
	{
		"folke/tokyonight.nvim"
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/playground",
			"nvim-treesitter/nvim-treesitter-refactor",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},
	{ "junegunn/fzf.vim" },
	{
		"junegunn/fzf",
		build = function()
			vim.fn["fzf#install"]()
		end,
	},

	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
		},
	},

	{
		"windwp/nvim-projectconfig",
		config = function()
			require("nvim-projectconfig").setup()
		end,
	},

	-- Completion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-git",
			"rcarriga/cmp-dap",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind-nvim",
			{ "L3MON4D3/LuaSnip", version = "v1.*" },
			"windwp/nvim-autopairs",
		},
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"jose-elias-alvarez/null-ls.nvim",
	},

	-- Installation of LSP/Debuggers/Other
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-telescope/telescope-fzy-native.nvim" },
			{ "kyazdani42/nvim-web-devicons" },
			{ "nvim-telescope/telescope-file-browser.nvim" },
			{ "nvim-telescope/telescope-dap.nvim" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
	},

	{
		"ThePrimeagen/git-worktree.nvim",
		config = function()
			require("git-worktree").setup({})
		end,
	},

	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({})
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
	},

	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
			"leoluz/nvim-dap-go",
			"mxsdev/nvim-dap-vscode-js",
		},
	},

	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
	},

	{
		"vim-test/vim-test"
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-go",
			"rouge8/neotest-rust",
			"nvim-neotest/neotest-plenary",
			"nvim-neotest/neotest-vim-test",
			-- "olimorris/neotest-phpunit",
		},
	},

	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	},

	"stevearc/dressing.nvim",
	"rcarriga/nvim-notify",
	"xiyaowong/nvim-transparent",

	"Raimondi/delimitMate",
	"lukas-reineke/indent-blankline.nvim",

	"tpope/vim-surround",
	"tpope/vim-repeat",
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"tpope/vim-dotenv",
	"tpope/vim-eunuch",

	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- Database client
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			"tpope/vim-dadbod",
			"kristijanhusak/vim-dadbod-completion",
			"tpope/vim-dotenv",
		},
	},

	-- Rest client
	{
		"NTBBloodbath/rest.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"anuvyklack/hydra.nvim",
		dependencies = "anuvyklack/keymap-layer.nvim", -- needed only for pink hydras
	},

	{
		"phaazon/mind.nvim",
		branch = "v2.2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

    {
        'voldikss/vim-floaterm'
    },

    -- markdown
    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    { 
        "iamcco/markdown-preview.nvim", 
        build= "cd app && npm install", 
        config = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, 
    },


    -- todo-comments
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
        require("todo-comments").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
        }
        end
    },

    -- autosave
    {
        "Pocco81/auto-save.nvim"
    },

    -- LaTex
    {
        'lervag/vimtex'
    },

    {
        'f3fora/nvim-texlabconfig',
        -- ft = { 'tex', 'bib' }, -- for lazy loading
        build = 'go build'
        -- run = 'go build -o ~/.bin/' if e.g. ~/.bin/ is in $PATH
    },


    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
    },

    -- icons
    {
        'kyazdani42/nvim-web-devicons'
    },

    -- neotree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
    }
    },

    {
        'anuvyklack/hydra.nvim'
    },

    -- ChatGPT
    {
        "jackMort/ChatGPT.nvim",
        config = function()
        require("chatgpt").setup({
        -- optional configuration
        })
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    },
}