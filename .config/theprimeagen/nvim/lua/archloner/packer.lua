-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.3',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Color schemes
  use { 'rose-pine/neovim', as = 'rose-pine' }
  use { 'NLKNguyen/papercolor-theme', as = 'papercolor' }
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "folke/tokyonight.nvim", as = "tokyonight" }
  use { "bluz71/vim-nightfly-colors", as = "nightfly" }
  use { "Mofiqul/dracula.nvim", as = "dracula" }
  use { "ellisonleao/gruvbox.nvim", as = "gruvbox" }
  use { "joshdick/onedark.vim", as = "onedark" }
  use { "shaunsingh/solarized.nvim", as = "solarized" }

  use "folke/trouble.nvim"

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,}

  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use("nvim-treesitter/nvim-treesitter-context")

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  use("folke/zen-mode.nvim")
  use("eandrju/cellular-automaton.nvim")
  use("laytan/cloak.nvim")

  use("nvim-tree/nvim-web-devicons")

  use("vim-airline/vim-airline")
  use("vim-airline/vim-airline-themes")

  use {'codota/tabnine-nvim', run='./dl_binaries.sh'}

end)
