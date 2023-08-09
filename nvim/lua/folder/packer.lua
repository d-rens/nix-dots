-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    --Packer can manage itself
    use('wbthomason/packer.nvim')

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {'akinsho/bufferline.nvim', tag = "*"}

    -- to learn get better movement
    --use { 'm4xshen/hardtime.nvim' }
    use { 'ThePrimeagen/vim-be-good' }

    use { 'folke/tokyonight.nvim', }
    use { "catppuccin/nvim", as = "catppuccin" }
    use {'norcalli/nvim-colorizer.lua'}

    --use { 'nvim-lualine/lualine.nvim',
        --requires = { 'nvim-tree/nvim-web-devicons', opt = true } }

    use { "epwalsh/obsidian.nvim"}

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('lervag/vimtex')
    use('Sirver/ultisnips')

    -- dont work
    --use('windwp/nvim-autopairs')
    --use('windwp/nvim-ts-autotag')

    use{ 'VonHeikemen/lsp-zero.nvim',
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

  end)
