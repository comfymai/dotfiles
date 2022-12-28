local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup {
    defaults = {
        file_ignore_patterns = { "node_modules", "yarn.lock" }
    },
    extensions = {
        file_browser = {
            theme = "ivy",
            hijack_netrw = true,
            mappings = {},
        }
    }
}

telescope.load_extension('fzf')
telescope.load_extension('file_browser')

vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, {})

vim.keymap.set("n", "<leader>sr", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>si", builtin.lsp_implementations, {})

vim.keymap.set("n", "<leader>fgc", builtin.git_commits, {})
vim.keymap.set("n", "<leader>fgt", builtin.git_bcommits, {})
vim.keymap.set("n", "<leader>fgb", builtin.git_branches, {})
vim.keymap.set("n", "<leader>fgs", builtin.git_status, {})
vim.keymap.set("n", "<leader>fgf", builtin.git_files, {})

vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer]' })
