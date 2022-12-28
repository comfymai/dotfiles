vim.keymap.set("n", "<leader>ft", "<cmd>Prettier<CR>")
vim.keymap.set("x", "<leader>ft", "<cmd>Prettier<CR>")

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
      semi = false,
      tab_width = 4,
      arrow_parens = "avoid",
      single_attribute_per_line = true
  }
})
