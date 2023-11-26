local pac = require('packer')
pac.init({
    max_jobs = 10,
})

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    --Packer can manage itself
    use('wbthomason/packer.nvim')

    use {
      'nvim-telescope/telescope.nvim', branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- jupyter notebooks
    use { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' }
    use { 'stevearc/dressing.nvim' }

    -- another jupyter try
    use { 'luk400/vim-jukit' }


    use { 'akinsho/bufferline.nvim' }

    use { 'ThePrimeagen/vim-be-good' }

    use { 'Zeioth/compiler.nvim' }

    use { 'folke/tokyonight.nvim' }

    use { 'smoka7/hop.nvim',
      tag = '*',
      config = function()
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      end
    }

    use { "catppuccin/nvim", as = "catppuccin" }
    use {'norcalli/nvim-colorizer.lua'}
    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end }

    use { "epwalsh/obsidian.nvim" }
    use { 'stevearc/overseer.nvim' }

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('lervag/vimtex')
    use('Sirver/ultisnips')

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
