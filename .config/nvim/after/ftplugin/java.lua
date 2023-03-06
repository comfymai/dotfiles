local jdtls = require("lspconfig")["jdtls"]
local default_config = jdtls.document_config.default_config

local java_debug = vim.fn.stdpath("data") ..
    "/mason" .. "/packages" .. "/java-debug-adapter" .. "/extension" .. "/server"

local config = {
    on_attach = function()
        require("jdtls.setup").add_commands()
        require('jdtls').setup_dap({ hotcodereplace = 'auto' })
    end,
    cmd = default_config.cmd,
    root_dir = default_config.root_dir(),
    settings = {
        java = {
            format = {},
        },
    },
    init_options = {
        bundles = {
            vim.fn.glob(java_debug .. "/com.microsoft.java.debug.plugin-*.jar", 1)
        },
    },
}
require("jdtls").start_or_attach(config)

local function keymap(motion, action)
    vim.keymap.set("n", motion, action)
end

-- [D]ebugger [B]reakpoint
keymap("<leader>db", function()
    require('dap').toggle_breakpoint()
end)

-- [D]ebugger [C]ontinue
keymap("<leader>dc", function()
    require('dap').continue()
end)

-- [D]ebugger [S]etup
-- Se roda antes de iniciar o debug mas depois do LSP carregar
-- TODO: Colocar essa chamada num hook
keymap("<leader>ds", function()
    require('jdtls.dap').setup_dap_main_class_configs()
end)

