require('gitsigns').setup {
    -- Exibe simbolos antes das line numbers
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = 'x' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    },
}

-- <leader-gs> pra abrir o menu do Git
-- No menu:
-- <s> em uma linha adiciona o arquivo ao commit (git add).
-- <u> em uma linha adicionada pra remover do commit (git rm --cached).
-- <cc> em qualquer lugar cria um prompt de commit (git commit).
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
