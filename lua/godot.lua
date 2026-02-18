-- Godot LSP
local port = 6005
local cmd = vim.lsp.rpc.connect('127.0.0.1', port)
local util = require 'lspconfig.util'

-- require('lspconfig').gdscript.setup {
--   cmd = cmd,
--   filetypes = { 'gd', 'gdscript', 'gdscript3' },
--   root_dir = require('lspconfig.util').root_pattern('project.godot', '.git'),
-- }

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "gd", "gdscript", "gdscript3" },
    callback = function(args)
        vim.lsp.start({
            name = "gdscript",
            cmd = cmd,
            root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
        })
    end,
})

-- 在godot工程文件nvim自动启动服务器
if vim.fn.filereadable(vim.fn.getcwd() .. "/project.godot") == 1 then
    local addr = './godot.pipe'
    if vim.fn.has 'win32' == 1 then
        addr = '127.0.0.1:6666'
    end
    vim.fn.serverstart(addr)
end
