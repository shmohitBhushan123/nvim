-- Initialize packer.nvim
vim.cmd [[packadd packer.nvim]]
require('packer').startup(function()
    -- Plugins
    use 'wbthomason/packer.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
    }
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'
    use 'neovim/nvim-lspconfig'
    use { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
    use { "scottmckendry/cyberdream.nvim" }
    use { "akinsho/bufferline.nvim", tag = '*', requires = "nvim-tree/nvim-web-devicons" }
    use { "nvim-telescope/telescope.nvim", tag = '0.1.8', requires = { {"nvim-lua/plenary.nvim"} } }
    use { 'rainbowhxch/accelerated-jk.nvim' }
    use {'mbbill/undotree'} 
    use {'nvim-lua/plenary.nvim' } 
    use {'theprimeagen/harpoon' } 
    use {'tpope/vim-fugitive' } 
    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
    }
    use({'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'})
    use({'neovim/nvim-lspconfig'})
    use({'hrsh7th/nvim-cmp'})
    use({'hrsh7th/cmp-nvim-lsp'})
    use {"williamboman/mason.nvim"}

end)



