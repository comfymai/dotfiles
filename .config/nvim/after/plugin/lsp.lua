-- Instalação de LSPs sem sair do Neovim (:Mason)
require("mason").setup()
require("mason-lspconfig").setup()
require("mason.settings").set({
    ui = {
        border = "rounded"
    }
})

-- Configuração dos LSPs
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        if vim.lsp.buf.format then
            vim.lsp.buf.format()
        elseif vim.lsp.buf.formatting then
            vim.lsp.buf.formatting()
        end
    end, { desc = "Format current buffer with LSP" })
end

-- Adiciona os keymaps e opções a cada LSP instalado
local get_servers = require('mason-lspconfig').get_installed_servers
for _, server_name in ipairs(get_servers()) do
    lspconfig[server_name].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

require('lspconfig')['jsonls'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        json = {
            -- Adiciona alguns schemas de JSON pra autocompletion
            schemas = require("schemastore").json.schemas {
                select = {
                    "package.json",
                    ".eslintrc",
                    "tsconfig.json",
                    "prettierrc.json",
                }
            },
            validate = { enable = true },
        },
    },
}

-- Configuração da autocompletion
local luasnip = require("luasnip")
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-u>'] = cmp.mapping.scroll_docs( -4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-m>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable( -1) then
                luasnip.jump( -1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    sources = {
        -- Completion usando...
        { name = 'nvim_lsp' }, -- ...LSP
        { name = 'luasnip' }, -- ...snippets
        { name = 'buffer' } -- ...conteúdo do buffer atual
    },
}

-- Exibe o status de carregamento do LSP/formatter
require("fidget").setup()

-- Adiciona algumas utilities e ações ao LSP do Typescript 
-- (import missing files, etc...)
local null_ls = require("null-ls")
require("typescript").setup {}
null_ls.setup {}

-- local function keymap(motion, action)
--     vim.keymap.set("n", motion, action)
-- end

-- require("lspsaga").setup {}
-- keymap("<leader>gh", "<cmd>Lspsaga lsp_finder<cr>")
-- keymap("<leader>ca", "<cmd>Lspsaga code_action<cr>")
-- keymap("<leader>pd", "<cmd>Lspsaga peek_definition<cr>")
-- keymap("<leader>gd", "<cmd>Lspsaga goto_definition<cr>")
-- keymap("K", "<cmd>Lspsaga hover_doc<cr>")
-- keymap("<leader>sl", "<cmd>Lspsaga show_line_diagnostics<cr>")
-- keymap("<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<cr>")
-- keymap("<leader>ot", "<cmd>Lspsaga term_toggle<cr>")
--
-- require("trouble").setup {}
-- keymap("<leader>xx", "<cmd>TroubleToggle<cr>")
-- keymap("<leader>xq", "<cmd>TroubleToggle quickfix<cr>")
--
