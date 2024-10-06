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
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'
    use 'neovim/nvim-lspconfig'
    use { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
    use { "scottmckendry/cyberdream.nvim" }
    use { "akinsho/bufferline.nvim", tag = '*', requires = "nvim-tree/nvim-web-devicons" }
    use { "nvim-telescope/telescope.nvim", tag = '0.1.8', requires = { {"nvim-lua/plenary.nvim"} } }
    use { 'rainbowhxch/accelerated-jk.nvim' }
end)



