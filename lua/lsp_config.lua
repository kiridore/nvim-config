vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--query-driver=C:/msys64/mingw64/bin/*"
    }
})

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

