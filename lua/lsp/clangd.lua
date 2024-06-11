require'lspconfig'.clangd.setup{
    cmd = {
        'clangd',
        '--header-insertion=never',
    }
}
