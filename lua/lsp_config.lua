local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
        'neocmake',
        'glsl_analyzer',
        'clangd',
        'rust_analyzer',
        'basedpyright',            -- python lsp
    },
    automatic_installation = true, -- 自动安装
})

-- Lua LSP
lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

-- C/C++ LSP
lspconfig.clangd.setup({
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--query-driver=C:/msys64/mingw64/bin/*"
    }
})

-- Rust LSP
lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            check = {
                command = "clippy",
            },
        },
    },
})

-- Python LSP
lspconfig.basedpyright.setup({
    capabilities = capabilities,
})

-- CMake LSP
lspconfig.neocmake.setup({
    capabilities = capabilities,
})

-- GLSL LSP
lspconfig.glsl_analyzer.setup({
    capabilities = capabilities,
})

-- 自动格式化配置
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- 启用 LSP 提供的格式化功能
        vim.keymap.set("n", "<leader>=", function()
            vim.lsp.buf.format({ async = true })
        end, { buffer = ev.buf, desc = "Format buffer" })
    end,
})

