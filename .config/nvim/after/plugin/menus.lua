local telescope = require("telescope")
local file_browser = require("telescope").extensions.file_browser
local builtin = require("telescope.builtin")

telescope.setup {
    defaults = {
        file_ignore_patterns = { "node_modules", "yarn.lock", "target/debug" }
    },
    extensions = {
        file_browser = {
            hijack_netrw = true,
            theme = "ivy"
        }
    }
}

telescope.load_extension('fzf')
telescope.load_extension('file_browser')

local browser_opts = {
    path = "%:p:h"
}

vim.keymap.set("n", "<leader>pv", function()
    file_browser.file_browser(browser_opts)
end)

vim.keymap.set("n", "<leader>px", function()
    vim.cmd("vsplit")
    file_browser.file_browser(browser_opts)
end)

vim.keymap.set("n", "<leader>pz", function()
    vim.cmd("hsplit")
    file_browser.file_browser(browser_opts)
end)

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
vim.keymap.set("n", "<leader>fq", builtin.quickfix, {})
vim.keymap.set("n", "<leader>fo", builtin.vim_options, {})
vim.keymap.set("n", "<leader>fc", builtin.command_history, {})

vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, {})

vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/', function()
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer]' })

-- Harpoon for quickly accessing important files
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end)
vim.keymap.set("n", "<leader>6", function() ui.nav_file(6) end)
