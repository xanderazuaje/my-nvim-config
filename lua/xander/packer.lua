-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.3',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { "ellisonleao/gruvbox.nvim" }
  use {"rebelot/kanagawa.nvim"}
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use ('ThePrimeagen/harpoon')
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive')
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  -- LSP Support
		  {'williamboman/mason.nvim'},
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason-lspconfig.nvim'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }
  use ('nvim-tree/nvim-tree.lua')
  use ('nvim-tree/nvim-web-devicons')
  use ('rstacruz/vim-closer')
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
  use {
    'andymass/vim-matchup',
    setup = function()
      -- may set any options here
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  }
  use {'mattn/emmet-vim'}
  use {'tpope/vim-surround'}
  use {
    'filipdutescu/renamer.nvim',
    branch = 'master',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end)
