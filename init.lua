-- 基础配置
require("basic")

-- 快捷键绑定
require("keybindings")

-- 插件管理
require("plugin")

-- 外观设置
require('colorscheme')

-- 插件配置
require('plugin-config.nvim-tree')
require('plugin-config.nvim-treesitter')
require('plugin-config.cmp')
require('plugin-config.nvim-task')
require('plugin-config.lspsaga')

require('lsp.lua')
require('lsp.clangd')

-- neovide config
require('neovide-config')
