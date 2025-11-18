local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("not found nvim-treesitter")
    return
end
-- windows下只有zig成功工作过
-- 如果是linux就正常使用gcc
if vim.loop.os_uname().sysname == "Linux" then
    require 'nvim-treesitter.install'.compilers = { "gcc" }
else 
    require 'nvim-treesitter.install'.compilers = { "zig" }
end

treesitter.setup({
    -- 安装 language parser
    -- :TSInstallInfo 命令查看支持的语言
    ensure_installed = {
        "c", "cpp", "vim", "lua", "cmake",
        "verilog", "python", "xml",
        "markdown_inline", "markdown", "hlsl", "glsl",
        "javascript"
    },
    -- 启用代码高亮模块
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true;
    },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    }
})

vim.api.nvim_set_option_value("foldmethod", "expr", {})
vim.api.nvim_set_option_value("foldexpr", "nvim_treesitter#foldexpr()", {})
-- 默认不折叠
vim.opt.foldlevel = 99
