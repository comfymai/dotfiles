require("tokyonight").setup {
    transparent = true,
    dim_inactive = true,
    styles = {
        sidebars = "transparent",
        floats = "transparent"
    }
}

vim.cmd("colorscheme tokyonight")

-- Bottom status line
require("lualine").setup {
    options = {
        theme = "tokyonight"
    }
}

-- Top winbar
require("barbecue").setup {
    theme = "tokyonight",
    create_autocmd = false,
}

vim.keymap.set("n", "<leader>b", function() require("barbecue.ui").toggle() end)

-- Scrollbar
require("scrollbar").setup()

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
