-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"

-- jkhl 移动时光标周围保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- 使用相对行号
vim.wo.number = true
vim.wo.relativenumber = false

-- 高亮所在行
vim.wo.cursorline = true

-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"

-- 右侧参考线，超过表示代码太长了，考虑换行
vim.wo.colorcolumn = "80"

-- 缩进4个空格等于一个Tab
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true

-- >> << 时移动长度
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4

-- 空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true

-- 新行对齐当前行
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true

-- 边输入边搜索
vim.o.incsearch = true

-- 文件被外部程序修改时自动更新
vim.o.autoread = true
vim.bo.autoread = true

-- 禁止拆行
vim.wo.wrap = false

-- 允许隐藏被修改过的buffer
vim.o.hidden = true

-- 鼠标支持
vim.o.mouse = "a"

-- 缩小文件更新时间
vim.o.updatetime = 300

-- 等待快捷键连击时间为500ms
vim.o.timeoutlen = 500

-- split window 从下和右方出现
vim.o.splitbelow = true
vim.o.splitright = true

-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"

-- 开启全彩色终端显示
vim.o.termguicolors = true
vim.opt.termguicolors = true

-- 是否显示不可见字符
vim.o.list = true

-- 将空格显示为一个点
vim.o.listchars = "space:·"

-- 补全增强
vim.o.wildmenu = true

-- 补全选项上限
vim.o.pumheight = 10

-- 永远显示tabline
vim.o.showtabline = 2

-- 使用air line（加强状态栏）插件后不在显示vim模式
vim.o.showmode = false


-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.background = "dark"

-- 显示诊断信息
vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = false,
})

