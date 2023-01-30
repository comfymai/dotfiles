vim.cmd [[packadd packer.nvim]]

require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- Themes
    use "folke/tokyonight.nvim"
    use "rose-pine/neovim"

    -- UI elements
    use "lukas-reineke/indent-blankline.nvim"
    use("petertriho/nvim-scrollbar")
    use("nvim-lualine/lualine.nvim") -- Bottom status bar
    use({
        "utilyre/barbecue.nvim",
        tag = "*",
        requires = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
        },
    }) -- Top winbar
    use("norcalli/nvim-colorizer.lua") -- Colour previewing
    use "lewis6991/gitsigns.nvim" -- 
    use "j-hui/fidget.nvim" -- Displays LSP/formatter status above status bar
    use "roobert/tailwindcss-colorizer-cmp.nvim"
    use "folke/todo-comments.nvim"
    use "nvim-tree/nvim-web-devicons"
    use "f-person/git-blame.nvim"

    -- Menus
    use { "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { "nvim-lua/plenary.nvim" } }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable "make" == 1 }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { "nvim-telescope/telescope-ui-select.nvim" }
    use "ThePrimeagen/harpoon"
    use "mbbill/undotree"
    use "tpope/vim-fugitive"
    use "tpope/vim-rhubarb"


    -- Motions
    use {
        'phaazon/hop.nvim',
        branch = 'v2',
    }
    use "tpope/vim-surround"
    use "windwp/nvim-ts-autotag"
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    }
    use("numToStr/Comment.nvim")

    -- LSP, completion and formatting
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
    use("jose-elias-alvarez/null-ls.nvim")
    use("MunifTanjim/prettier.nvim")
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        requires = { { "nvim-tree/nvim-web-devicons" } }
    })
    use "jose-elias-alvarez/typescript.nvim"
    use "b0o/schemastore.nvim"

    -- Other
    use "andweeb/presence.nvim" -- Discord presence
    use "tpope/vim-obsession"
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use "h-hg/fcitx.nvim" -- For Japanese input with fcitx5
end)

require("colorizer").setup()
require("Comment").setup()
require("todo-comments").setup()
require("tailwindcss-colorizer-cmp").setup({
    color_square_width = 1,
    color_hint_width = 1
})
