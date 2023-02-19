require("mason.settings").set({
    ui = {
        border = "rounded"
    }
})

local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    "tsserver",
    "eslint",
    "rust_analyzer",
    "jsonls",
    "cssls",
    "tailwindcss",
    "prismals",
    "html"
})

lsp.nvim_workspace()

lsp.set_preferences({
    sign_icons = {},
})

require("fidget").setup()

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
    -- formatting = {
    --     -- The normal setup apparently doesn't work properly with lsp-zero
    --     -- but this gets the job done.
    --     format = function(entry, vim_item)
    --         local formatter = require("tailwindcss-colorizer-cmp").formatter
    --         return formatter(entry, vim_item)
    --     end
    -- }
})


lsp.configure("jsonls", {
    settings = {
        json = {
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
})

lsp.on_attach(function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = "LSP: " .. desc
        end

        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end

    nmap("<leader>e", vim.diagnostic.open_float)
    nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

    nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
    nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
    nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
    nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
    nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
    nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

    nmap("K", vim.lsp.buf.hover, "Hover Documentation")
    nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

    nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
    nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
    nmap("<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "[W]orkspace [L]ist Folders")

    vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        if vim.lsp.buf.format then
            vim.lsp.buf.format()
        elseif vim.lsp.buf.formatting then
            vim.lsp.buf.formatting()
        end
    end, { desc = "Format current buffer with LSP" })

end)

lsp.setup()

-- For code actions in Typescript files (add missing imports, format imports, etc.)
local null_ls = require("null-ls")
require("typescript").setup {}
null_ls.setup {}

local function keymap (motion, action)
    vim.keymap.set("n", motion, action)
end

require("lspsaga").setup {
    ui = {
        code_action = "",
    }
}
keymap("<leader>gh", "<cmd>Lspsaga lsp_finder<cr>")
keymap("<leader>ca", "<cmd>Lspsaga code_action<cr>")
keymap("<leader>pd", "<cmd>Lspsaga peek_definition<cr>")
keymap("<leader>gd", "<cmd>Lspsaga goto_definition<cr>")
keymap("K", "<cmd>Lspsaga hover_doc<cr>")
keymap("<leader>sl", "<cmd>Lspsaga show_line_diagnostics<cr>")
keymap("<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<cr>")
keymap("<leader>ot", "<cmd>Lspsaga term_toggle<cr>")

require("trouble").setup {}
keymap("<leader>xx", "<cmd>TroubleToggle<cr>")
keymap("<leader>xq", "<cmd>TroubleToggle quickfix<cr>")
