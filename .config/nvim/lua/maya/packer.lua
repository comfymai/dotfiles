vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- colour themes
    use "folke/tokyonight.nvim"
    use "rafamadriz/neon"


    -- discord presence
    use 'andweeb/presence.nvim'

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { 'nvim-telescope/telescope-ui-select.nvim' }
    use 'ThePrimeagen/harpoon'

    use 'tpope/vim-surround'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/prettier.nvim')

    -- hex colour preview
    use("norcalli/nvim-colorizer.lua")
    -- pwetty status line
    use("nvim-lualine/lualine.nvim")

    use("numToStr/Comment.nvim")

    -- git stuff
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'lewis6991/gitsigns.nvim'

    use "mbbill/undotree"

    -- lsp zero
    use {
        'VonHeikemen/lsp-zero.nvim',
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
    use "j-hui/fidget.nvim"

    -- language icons
    use 'nvim-tree/nvim-web-devicons'

    -- todo and other meta comments highlighting
    use 'folke/todo-comments.nvim'

    -- markdown preview
    use 'ellisonleao/glow.nvim'
    use 'simrat39/symbols-outline.nvim'
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use "manzeloth/live-server"

    use "easymotion/vim-easymotion"
end)

require("colorizer").setup()
require('Comment').setup()
require("todo-comments").setup()
