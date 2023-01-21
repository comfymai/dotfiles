vim.cmd [[packadd packer.nvim]]

require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- Temas
    use "folke/tokyonight.nvim"
    use "ray-x/aurora"
    use { "catppuccin/nvim", as = "catppuccin" }

    -- Automaticamente fecha delimitadores ({}, ()...)
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- Feedback visual de indentação
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

    -- Preview de cores dentro do Vim
    use("norcalli/nvim-colorizer.lua")

    -- Status bar
    use("nvim-lualine/lualine.nvim")

    -- Integração com Prettier
    use("jose-elias-alvarez/null-ls.nvim")
    use("MunifTanjim/prettier.nvim")

    -- Adiciona keymaps pra comentar linhas
    use("numToStr/Comment.nvim")

    -- Integração com Git
    use "tpope/vim-fugitive"
    use "tpope/vim-rhubarb"
    use "lewis6991/gitsigns.nvim"

    -- Exibe o histórico de edições do arquivo numa lista
    use "mbbill/undotree"

    -- LSP Zero
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
    -- Exibe um feedback do carregamento dos LSP
    use "j-hui/fidget.nvim"

    -- Schemas pro autocompletion do jsonls
    use "b0o/schemastore.nvim"

    -- Exibe ícones na status bar, Telescope, etc...
    use "nvim-tree/nvim-web-devicons"

    -- Highlight em comentários especiais (TODO, NOTE, etc...)
    use "folke/todo-comments.nvim"

    -- Markdown preview
    use "ellisonleao/glow.nvim"
    use "simrat39/symbols-outline.nvim"
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- Discord
    use "andweeb/presence.nvim"

    -- Basically cheating
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }

    -- Persistir sessões, combinado com tmux-ressurrect
    use "tpope/vim-obsession"

    -- Preview das cores do Tailwind
    use "roobert/tailwindcss-colorizer-cmp.nvim"

    -- Integração com fcitx (método de entrada)
    use "h-hg/fcitx.nvim"
end)

require("colorizer").setup()
require("Comment").setup()
require("todo-comments").setup()
