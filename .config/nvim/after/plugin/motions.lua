-- Keymaps do hop.nvim
-- Modificadores:
-- w = pra frente (word)
-- b = pra trás (back)
-- h = na linha atual (here)
-- i = em todos os buffers abertos (inter)
-- repetição = em qualquer lugar do buffer atual

-- Salto pra palavras
vim.keymap.set("n", "<leader><leader>w", "<cmd>HopWordAC<cr>")
vim.keymap.set("v", "<leader><leader>w", "<cmd>HopWordAC<cr>")

vim.keymap.set("n", "<leader><leader>b", "<cmd>HopWordBC<cr>")
vim.keymap.set("v", "<leader><leader>b", "<cmd>HopWordBC<cr>")

vim.keymap.set("n", "<leader><leader>h", "<cmd>HopWordCurrentLine<cr>")
vim.keymap.set("v", "<leader><leader>h", "<cmd>HopWordCurrentLine<cr>")

vim.keymap.set("n", "<leader><leader>a", "<cmd>HopWord<cr>")
vim.keymap.set("v", "<leader><leader>a", "<cmd>HopWord<cr>")

vim.keymap.set("n", "<leader><leader>i", "<cmd>HopWordMW<cr>")
vim.keymap.set("v", "<leader><leader>i", "<cmd>HopWordMW<cr>")

-- Salto pra começo de linhas - l
vim.keymap.set("n", "<leader><leader>lw", "<cmd>HopLineStartAC<cr>")
vim.keymap.set("v", "<leader><leader>lw", "<cmd>HopLineStartAC<cr>")

vim.keymap.set("n", "<leader><leader>lb", "<cmd>HopLineStartBC<cr>")
vim.keymap.set("v", "<leader><leader>lb", "<cmd>HopLineStartBC<cr>")

vim.keymap.set("n", "<leader><leader>ll", "<cmd>HopLineStart<cr>")
vim.keymap.set("v", "<leader><leader>ll", "<cmd>HopLineStart<cr>")

vim.keymap.set("n", "<leader><leader>li", "<cmd>HopLineStartMW<cr>")
vim.keymap.set("v", "<leader><leader>li", "<cmd>HopLineStartMW<cr>")

-- Salto pra par de caracteres - c
vim.keymap.set("n", "<leader><leader>cw", "<cmd>HopChar2AC<cr>")
vim.keymap.set("v", "<leader><leader>cw", "<cmd>HopChar2AC<cr>")

vim.keymap.set("n", "<leader><leader>cb", "<cmd>HopChar2BC<cr>")
vim.keymap.set("v", "<leader><leader>cb", "<cmd>HopChar2BC<cr>")

vim.keymap.set("n", "<leader><leader>cc", "<cmd>HopChar2<cr>")
vim.keymap.set("v", "<leader><leader>cc", "<cmd>HopChar2<cr>")

vim.keymap.set("n", "<leader><leader>ci", "<cmd>HopChar2MW<cr>")
vim.keymap.set("v", "<leader><leader>ci", "<cmd>HopChar2MW<cr>")

vim.keymap.set("n", "<leader><leader>ch", "<cmd>HopChar2CurrentLine<cr>")
vim.keymap.set("v", "<leader><leader>ch", "<cmd>HopChar2CurrentLine<cr>")

-- Salto vertical (entre linhas na mesma coluna) - v
vim.keymap.set("n", "<leader><leader>vw", "<cmd>HopVerticalAC<cr>")
vim.keymap.set("v", "<leader><leader>vw", "<cmd>HopVerticalAC<cr>")

vim.keymap.set("n", "<leader><leader>vb", "<cmd>HopVerticalBC<cr>")
vim.keymap.set("v", "<leader><leader>vb", "<cmd>HopVerticalBC<cr>")

vim.keymap.set("n", "<leader><leader>vi", "<cmd>HopVerticalMW<cr>")
vim.keymap.set("v", "<leader><leader>vi", "<cmd>HopVerticalMW<cr>")

vim.keymap.set("n", "<leader><leader>vv", "<cmd>HopVertical<cr>")
vim.keymap.set("v", "<leader><leader>vv", "<cmd>HopVertical<cr>")

-- Salto pra padrão especificado - p
vim.keymap.set("n", "<leader><leader>p", "<cmd>HopPattern<cr>")
vim.keymap.set("v", "<leader><leader>p", "<cmd>HopPattern<cr>")

