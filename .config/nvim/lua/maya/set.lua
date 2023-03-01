-- Desabilita o NetRw (explorador padrão do Vim)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Exibe line numbers
vim.opt.nu = true
-- Exibe as line numbers relativamente à atual
vim.opt.relativenumber = true

-- Configura <Tab> como 4 espaços
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Desabilita o highlight de busca após confirmação
vim.opt.hlsearch = false

-- Corrige algumas indentações
vim.opt.smartindent = true

-- Desabilita word wrap
-- (word wrapping no Vim me atrapalha demais)
vim.opt.wrap = false

vim.opt.termguicolors = true

-- Evita que o viewport vá muito pro canto
vim.opt.scrolloff = 12
vim.opt.sidescrolloff = 12

vim.opt.updatetime = 50

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.completeopt = "menuone,noselect"

-- Muda a <leader> de <\> pra <space>
vim.g.mapleader = " "
