-- 基础配置
require("basic")

-- 插件管理
require("plugin")

-- 插件配置
require('plugin-config.nvim-tree')
require('plugin-config.nvim-treesitter')
require('plugin-config.cmp')
require('plugin-config.lspsaga')
require('plugin-config.glance')
require('plugin-config.illuminate')

require('lsp.lua')
require('lsp.clangd')
require('lsp.cmake')
require('lsp.glsl_analyzer')
require('lsp.rust')

-- neovide config
require('neovide-config')

require('dap_config')

-- 快捷键绑定
require("keybindings")

