-- Initialize packer.nvim
vim.cmd [[packadd packer.nvim]]
require('packer').startup(function()
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'wbthomason/packer.nvim'
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
  }
  use { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
  use { "akinsho/bufferline.nvim", tag = '*', requires = "nvim-tree/nvim-web-devicons" }
  use { "nvim-telescope/telescope.nvim", tag = '0.1.8', requires = { { "nvim-lua/plenary.nvim" } } }
  use { 'rainbowhxch/accelerated-jk.nvim' }
  use { 'mbbill/undotree' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'theprimeagen/harpoon' }
  use { 'tpope/vim-fugitive' }
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  -- LSP Support
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { 'neovim/nvim-lspconfig' },
      -- Auto-completion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  -- Noice with proper dependencies
  use {
    'folke/noice.nvim',
    requires = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    }
  }

  -- Other plugins
  use 'folke/snacks.nvim'
  use { 'rose-pine/neovim', as = 'rose-pine' }
  use 'kdheepak/lazygit.nvim'
  use 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
  use 'loctvl842/monokai-pro.nvim'
  use 'olimorris/codecompanion.nvim'
  use {
    "tzachar/local-highlight.nvim",
    config = function()
      require('local-highlight').setup()
    end
  }
  use 'nvim-neotest/nvim-nio'
  use 'ravitemer/mcphub.nvim'

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup {}
    end
  }
  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  })
  use {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup()
    end
  }
  use({
    "olimorris/codecompanion.nvim",
    config = function()
      require("codecompanion").setup()
    end,
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/mcphub.nvim"
    }
  })
  use({
    "metalelf0/black-metal-theme-neovim",
    config = function()
      require("black-metal").setup {
        theme = "immortal", -- Use the Immortal theme variant
      }
      require("black-metal").load()
    end,
  })
end)
