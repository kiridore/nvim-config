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
require('plugin-config.copilot')

require('lsp_config')

-- neovide config
require('neovide-config')

require('dap_config')

-- 快捷键绑定
require("keybindings")

