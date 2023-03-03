vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'hrsh7th/vim-vsnip-integ'
  use 'SmiteshP/nvim-navic'
  use 'ThePrimeagen/refactoring.nvim'
  use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
  use 'antoinemadec/FixCursorHold.nvim'
  use 'dracula/vim'
  use 'folke/tokyonight.nvim'
  use 'folke/trouble.nvim'
  use 'haydenmeade/neotest-jest'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use {
    'hrsh7th/cmp-vsnip',
    after = 'nvim-cmp',
    requires = {
      'hrsh7th/vim-vsnip',
      {
        'rafamadriz/friendly-snippets',
        after = 'cmp-vsnip'
      }
    }
  }
  use 'kshenoy/vim-signature'
  use 'lewis6991/gitsigns.nvim'
  use 'mfussenegger/nvim-dap'
  use 'mhartington/oceanic-next'
  use 'mxsdev/nvim-dap-vscode-js'
  use {
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'j-hui/fidget.nvim',
      'folke/neodev.nvim',
    },
  }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }
  use 'numToStr/Comment.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-neotest/neotest'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'onsails/lspkind.nvim'
  use 'rcarriga/nvim-dap-ui'
  use 'sainnhe/sonokai'
  use 'shaunsingh/nord.nvim'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'windwp/nvim-autopairs'
  use 'winston0410/cmd-parser.nvim'
  use 'winston0410/range-highlight.nvim'
end)
