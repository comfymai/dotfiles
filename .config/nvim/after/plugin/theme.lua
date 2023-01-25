require("rose-pine").setup({
    dark_variant = "moon",
    disable_background = true,
    disable_float_background = true,
    groups = {
        punctuation = "pine", -- Default is too faded
    }
})

vim.cmd("colorscheme rose-pine")
