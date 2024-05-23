local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("not found nvim-treesitter")
    return
end
-- windows下只有zig成功工作过
require 'nvim-treesitter.install'.compilers = { "zig" }

treesitter.setup({
    -- 安装 language parser
    -- :TSInstallInfo 命令查看支持的语言
    ensure_installed = {"c", "cpp", "vim", "lua",},
    -- 启用代码高亮模块
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true;
    },
})

