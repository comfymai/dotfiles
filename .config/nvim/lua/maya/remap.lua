-- Ajuste automático do viewport após algumas motions
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "G", "Gzz")

-- <K> ou <J> com linhas selecionadas pra mover elas verticalmente
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Cola algo em cima de uma seleção sem perder o conteúdo copiado
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Copia uma seleção ou objeto pro clipboard do sistema
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"*Y")

vim.keymap.set("n", "<leader>ft", "<cmd>Format<cr>")

vim.keymap.set("n", "<leader>gb", "<cmd>GitBlameToggle<cr>")

vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("W", "w", {})

