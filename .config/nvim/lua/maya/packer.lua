vim.cmd [[packadd packer.nvim]]

require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use "folke/tokyonight.nvim"
    use "ray-x/aurora"

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use "lukas-reineke/indent-blankline.nvim"

    -- Telescope and Harpoon for comfy file navigation
    use { "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { "nvim-lua/plenary.nvim" } }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable "make" == 1 }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { "nvim-telescope/telescope-ui-select.nvim" }
    use "ThePrimeagen/harpoon"

    use "tpope/vim-surround"

    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    }

    -- Colour preview
    use("norcalli/nvim-colorizer.lua")
    use("nvim-lualine/lualine.nvim")

    use("jose-elias-alvarez/null-ls.nvim")
    use("MunifTanjim/prettier.nvim")

    use("numToStr/Comment.nvim")

    use "tpope/vim-fugitive"
    use "tpope/vim-rhubarb"
    use "lewis6991/gitsigns.nvim"

    use "mbbill/undotree"

    -- LSP Zero setup
    use {
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        }
    }
    -- LSP status
    use "j-hui/fidget.nvim"
    -- Schemas for jsonls
    use "b0o/schemastore.nvim"

    use "nvim-tree/nvim-web-devicons"

    use "folke/todo-comments.nvim"

    -- .md preview
    use "ellisonleao/glow.nvim"
    use "simrat39/symbols-outline.nvim"
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- Discord presence
    use "andweeb/presence.nvim"

    use "turbio/bracey.vim"

    -- Basically cheating
    use "easymotion/vim-easymotion"

    -- Persist sessions through reboots, paired with tmux-ressurect
    use "tpope/vim-obsession"

    use "roobert/tailwindcss-colorizer-cmp.nvim"
end)

require("colorizer").setup()
require("Comment").setup()
require("todo-comments").setup()
