-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({ "bluz71/vim-moonfly-colors", 
  	as = "moonfly",
  })

  vim.cmd [[colorscheme moonfly]]

use {
			'nvim-treesitter/nvim-treesitter',
			run = function()
				local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
				ts_update()
			end,}
  use("nvim-treesitter/playground")
  use("theprimeagen/harpoon")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use("itchyny/lightline.vim")
  use("itchyny/vim-gitbranch")
  use("preservim/nerdtree")
  use("ryanoasis/vim-devicons")
  
  use("nvim-tree/nvim-web-devicons") 
  use("lewis6991/gitsigns.nvim")
  use("romgrk/barbar.nvim")

  use('neovim/nvim-lspconfig')
  use('simrat39/rust-tools.nvim')
  use('nvim-lua/plenary.nvim')
  use('mfussenegger/nvim-dap')
  use('rcarriga/nvim-dap-ui')
  use('mfussenegger/nvim-dap-python')
  use('mxsdev/nvim-dap-vscode-js')
  use('airblade/vim-gitgutter')


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


end)
