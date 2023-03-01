require("tokyonight").setup {
    style = "storm",
    transparent = true,
    dim_inactive = true,
    styles = {
        sidebars = "transparent",
        floats = "transparent"
    },
    -- tons de roxo e rosa
    on_colors = function(colors)
        colors.cyan = "#d080ff"
        colors.blue = "#de7af7"
        colors.blue0 = "#803da1"
        colors.blue1 = "#fcb3ff"
        colors.blue2 = "#ed1fd8"
        colors.blue5 = "#ff80e3"
        colors.blue6 = "#f9b4ea"
        colors.blue7 = "#70396e"

        colors.comment = "#785689"
        colors.fg = "#f1c0f5"
        colors.fg_dark = "#cda9d6"
        colors.fg_float = "#f1c0f5"

        colors.green = "#a680ed"
        colors.green1 = "#7a73da"
        colors.yellow = "#f56481"
        colors.orange = "#ff619b"
        colors.red1 = "#db4b74"

        colors.warning = "#ff80a8"
        colors.error = "#fc3a67"
    end,
    on_highlights = function(highlights, colors)
        local prompt = "#e4b0f7"
        highlights.TelescopeNormal = {
            bg = colors.none,
            fg = "#ac99ff",
        }
        highlights.TelescopeBorder = {
            bg = colors.none,
            fg = colors.none,
        }
        highlights.TelescopePromptNormal = {
            bg = colors.none,
            fg = prompt,
        }
        highlights.TelescopePromptBorder = {
            bg = colors.none,
            fg = prompt,
        }
        highlights.TelescopePromptTitle = {
            bg = colors.none,
            fg = prompt,
        }
        highlights.TelescopePreviewTitle = {
            bg = colors.none,
            fg = colors.none,
        }
        highlights.TelescopeResultsTitle = {
            bg = colors.none,
            fg = colors.none,
        }
        highlights.FidgetTitle = {
            fg = colors.blue2,
            bg = colors.none
        }
        highlights.NonText = {
            bg = colors.none,
            fg = colors.blue
        }
    end,
}

vim.cmd("colorscheme tokyonight")

-- barra de status inferior
require("lualine").setup {
    options = {
        theme = "tokyonight"
    }
}

-- barra de posição superior
require("barbecue").setup {
    theme = "tokyonight",
    create_autocmd = false,
}
vim.keymap.set("n", "<leader>b", function() require("barbecue.ui").toggle() end)

require("scrollbar").setup()

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
