vim.cmd [[packadd packer.nvim]]

require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- Themes
    use "folke/tokyonight.nvim"
    use "ray-x/aurora"
    use { "catppuccin/nvim", as = "catppuccin" }
    use "rose-pine/neovim"

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use "lukas-reineke/indent-blankline.nvim"

    use { "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { "nvim-lua/plenary.nvim" } }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable "make" == 1 }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { "nvim-telescope/telescope-ui-select.nvim" }
    use "ThePrimeagen/harpoon"

    use "tpope/vim-surround"

    use "windwp/nvim-ts-autotag"

    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    }

    use("norcalli/nvim-colorizer.lua")

    use("nvim-lualine/lualine.nvim")

    use("jose-elias-alvarez/null-ls.nvim")
    use("MunifTanjim/prettier.nvim")

    use("numToStr/Comment.nvim")

    use "tpope/vim-fugitive"
    use "tpope/vim-rhubarb"
    use "lewis6991/gitsigns.nvim"

    use "mbbill/undotree"

    use {
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        }
    }
    use "j-hui/fidget.nvim"

    use "jose-elias-alvarez/typescript.nvim"

    use "b0o/schemastore.nvim"

    use "nvim-tree/nvim-web-devicons"

    use "folke/todo-comments.nvim"

    use "simrat39/symbols-outline.nvim"
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use "andweeb/presence.nvim"

    use {
        'phaazon/hop.nvim',
        branch = 'v2',
    }

    use "tpope/vim-obsession"

    use "roobert/tailwindcss-colorizer-cmp.nvim"

    -- For proper Japanese input
    use "h-hg/fcitx.nvim"
end)

require("colorizer").setup()
require("Comment").setup()
require("todo-comments").setup()
require("tailwindcss-colorizer-cmp").setup({
    color_square_width = 1,
    color_hint_width = 1
})
