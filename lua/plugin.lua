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
    -- 显示上下文
    {"nvim-treesitter/nvim-treesitter-context"},
    -- 彩色括号
    {"p00f/nvim-ts-rainbow"},
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
        opts = {
            hint_enable = false,
            hint_prefix = "H"
        },
        config = function(_, opts) require'lsp_signature'.setup(opts) end
    },
    -- snip引擎
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    -- 更好的注释
    {
        'numToStr/Comment.nvim',
        opts = { },
        lazy = false,
    },
    -- blankline
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    -- 滚动条
    {"dstein64/nvim-scrollview"},
    -- 大文件编辑优化
    {"LunarVim/bigfile.nvim"},
    -- git diff 查看 无法运行
    -- {"sindrets/diffview.nvim"},
    -- 更好的terminal
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    -- 更清晰的F\f\T\t
    {"rhysd/clever-f.vim"},
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

require('lsp_signature').setup({})
require("luasnip.loaders.from_vscode").lazy_load()
require("ibl").setup()
require('scrollview').setup({
    always_show = true,
    excluded_filetypes = {'nerdtree'},
    current_only = true,
    base = 'buffer',
    column = 80,
    signs_on_startup = {'all'},
    diagnostics_severities = {vim.diagnostic.severity.ERROR}
})
require("bigfile").setup {
  filesize = 2, -- size of the file in MiB, the plugin round file sizes to the closest MiB
  pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
  features = { -- features to disable
    "indent_blankline",
    "illuminate",
    "lsp",
    "treesitter",
    "syntax",
    "matchparen",
    "vimopts",
    "filetype",
  },
}
