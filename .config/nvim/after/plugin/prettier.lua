-- <leader-fp> pra formatar o buffer atual com o Prettier
vim.keymap.set("n", "<leader>fp", "<cmd>Prettier<CR>")

local prettier = require("prettier")

prettier.setup({
    bin = 'prettier',
    filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
    },
    cli_options = {
        tab_width = 4,
        arrow_parens = "avoid",
        single_attribute_per_line = true -- Eu acho legibilidade algo muito bonito... 
    }
})
