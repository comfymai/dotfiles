require("rose-pine").setup {
    disable_background = true,
    disable_float_background = true
}

vim.cmd ("colorscheme rose-pine")

-- Bottom status line
require("lualine").setup {
    options = {
        theme = "rose-pine"
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

