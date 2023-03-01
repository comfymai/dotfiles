vim.cmd [[packadd packer.nvim]]

require("packer").startup(function(use)
    -- PLugin manager
    use "wbthomason/packer.nvim"

    -- Temas
    use "folke/tokyonight.nvim"

    -- Elementos da interface
    use "lukas-reineke/indent-blankline.nvim" -- Linhas de indentação
    use("petertriho/nvim-scrollbar") -- Auto-explicativo
    use("nvim-lualine/lualine.nvim") -- Barra de status inferior
    use({
        "utilyre/barbecue.nvim",
        tag = "*",
        requires = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
        },
    }) -- Barra de posição superior
    use("norcalli/nvim-colorizer.lua") -- Preview de cores
    use "lewis6991/gitsigns.nvim" -- Mudanças do Git por linha
    use "j-hui/fidget.nvim" -- Status do LSP
    use "roobert/tailwindcss-colorizer-cmp.nvim" -- Preview de cores do Tailwind
    use "folke/todo-comments.nvim" -- Highlight de comentários especiais
    use "nvim-tree/nvim-web-devicons" -- Ìcones de linguages nos menus
    use "f-person/git-blame.nvim"

    -- Menus
    -- O belíssimo Telescope: fuzzy finder e file browser
    use { "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { "nvim-lua/plenary.nvim" } }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable "make" == 1 }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { "nvim-telescope/telescope-ui-select.nvim" }
    use "ThePrimeagen/harpoon" -- Acesso rápido à arquivos marcados
    use "mbbill/undotree" -- Histórico de mudanças de arquivos
    use "tpope/vim-fugitive" -- Git dentro do Neovim
    use "tpope/vim-rhubarb"


    -- Motions
    -- >: after/plugins/motions.lua
    use {
        "phaazon/hop.nvim",
        branch = "v2",
    }
    -- Motions pra modificar símbolos ao redor (ex.: <cs'">, <ysw(>, etc.)
    use "tpope/vim-surround"
    -- Automaticamente fecha tags em JSX
    use "windwp/nvim-ts-autotag"
    -- Automaticamente fecha parênteses
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    -- Syntax highlighting+
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    }
    -- Motions pra comentários (ex.: <gcc>)
    use("numToStr/Comment.nvim")


    -- LSP e autocompletion
    use 'neovim/nvim-lspconfig'
    use "rafamadriz/friendly-snippets"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lsp"
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use("jose-elias-alvarez/null-ls.nvim")
    use("MunifTanjim/prettier.nvim")
    use("editorconfig/editorconfig-vim")
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        requires = { { "nvim-tree/nvim-web-devicons" } },
        after = "neovim/nvim-lspconfig"
    })
    use "jose-elias-alvarez/typescript.nvim"
    use "b0o/schemastore.nvim"
    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons"
    }

    -- Presença do Discord
    use "andweeb/presence.nvim" 
    -- Persistência de sessões
    use "tpope/vim-obsession"
    -- Preview de .md
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    -- Pra input com fcitx5 (日本語入力には不可欠ですよ〜)
    use "h-hg/fcitx.nvim"
end)

require("colorizer").setup()
require("Comment").setup()
require("todo-comments").setup()
require('nvim-ts-autotag').setup()
require("tailwindcss-colorizer-cmp").setup({
    color_square_width = 1,
    color_hint_width = 1
})
