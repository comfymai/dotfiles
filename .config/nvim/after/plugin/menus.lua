local telescope = require("telescope")
local file_browser = require("telescope").extensions.file_browser
local builtin = require("telescope.builtin")

telescope.setup {
    defaults = {
        -- Exclui arquivos irrelevantes dos finders (ex.: libs, lockfiles, build files...)
        file_ignore_patterns = { "node_modules", "yarn.lock", "target/debug", "dist" }
    },
    extensions = {
        -- Sobrepõe o NetRw com o file browser do próprio Telescope
        file_browser = {
            hijack_netrw = true,
            theme = "ivy"
        }
    }
}

telescope.load_extension('fzf')
telescope.load_extension('file_browser')

local browser_opts = {
    -- Faz com que o explorador abra relativo ao arquivo atual
    -- (ao invés da raiz do projeto por padrão)
    path = "%:p:h"
}

-- <leader-pv> abre o explorador no buffer atual
vim.keymap.set("n", "<leader>pv", function()
    file_browser.file_browser(browser_opts)
end)

-- <leader-px> abre o explorador num novo buffer ao lado
vim.keymap.set("n", "<leader>px", function()
    vim.cmd("vsplit")
    file_browser.file_browser(browser_opts)
end)

-- <leader-pz> abre o explorador num novo buffer em cima
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

-- Harpoon pra marcar arquivos frequentes por projeto
-- <leader-a> marca o arquivo atual.
vim.keymap.set("n", "<leader>a", require("harpoon.mark").add_file)
-- <Ctrl-e> exibe os arquivos marcados.
vim.keymap.set("n", "<C-e>", require("harpoon.ui").toggle_quick_menu)

-- <leader-1> a <leader-6> pra saltar entre os arquivos marcados em ordem
vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end)
vim.keymap.set("n", "<leader>6", function() ui.nav_file(6) end)
