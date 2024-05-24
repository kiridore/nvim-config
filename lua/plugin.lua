local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- 色彩主题
    { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
    { "EdenEast/nightfox.nvim" },
    -- 更好的开始界面
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    },
    -- 更好的buffer line
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    -- lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    -- 自动括号补全
    {'m4xshen/autoclose.nvim'},
    -- nvim-tree
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },
    -- 模糊文件搜索
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- 快捷键绑定查询
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = { }
    },
    -- 代码高亮
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    -- Git支持 :Git
    {"tpope/vim-fugitive"},
    -- LSP
    { 'neovim/nvim-lspconfig' },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    -- Git Line
    {'lewis6991/gitsigns.nvim'},
    -- 代码补全
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'},
    {'hrsh7th/nvim-cmp'},
    -- 函数参数表高亮
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts) require'lsp_signature'.setup(opts) end
    },

})

-- 启动插件
require('bufferline').setup()
require('lualine').setup()
require('autoclose').setup()
require('gitsigns').setup()

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        "lua_ls",
    }
})

