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
    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000, -- make sure to load this before all the other start plugins
        -- Optional; default configuration will be used if setup isn't called.
        config = function()
            require("everforest").setup({ })
        end,
    },
    {'shaunsingh/nord.nvim'},
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
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
    -- surround 快捷添加括号引号
    -- 把mini系列全部装上了
    { 'echasnovski/mini.nvim', version = '*' },
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
    {"hiphish/rainbow-delimiters.nvim"},
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
    {'ray-x/cmp-treesitter'},
    {'saadparwaiz1/cmp_luasnip'},
    -- 函数参数表高亮
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {
            bind = true,
            hint_enable = true,
            hint_prefix = "Hint:",
            floating_window = true,
            floating_window_above_cur_line = true,
            transparency = nil,
            warp = true,
            zindex = 45,
            handler_opts = { border = "single" },
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
    -- git diff 查看 VDI无法运行
    {"sindrets/diffview.nvim"},
    -- 更好的terminal
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    -- 更清晰的F\f\T\t
    {"rhysd/clever-f.vim"},
    -- trouble list
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            position = "right",
        },
        cmd = "Trouble",
    },
    -- debug 套件
    {'mfussenegger/nvim-dap'} ,
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}
    },
    -- 删除当前buffer
    {'ojroques/nvim-bufdel'},
    -- 带加速的j k
    { 'rainbowhxch/accelerated-jk.nvim' },
    -- better lsp function
    {
        'nvimdev/lspsaga.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
            'nvim-tree/nvim-web-devicons',     -- optional
        }
    },
    -- 显示LSP工作日志
    {
        "j-hui/fidget.nvim",
        opts = { },
    },
    {
        "smoka7/hop.nvim",
        lazy = true,
        version = "*",
        event = { "CursorHold", "CursorHoldI" },
        config = {},
    },
    -- nvim task 构建工具
    {
        "Shatur/neovim-tasks",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    -- lsp悬浮窗
    { "dnlhc/glance.nvim" },
    -- outlines
    {
        "hedyhli/outline.nvim",
        lazy = true,
        cmd = { "Outline", "OutlineOpen" },
        keys = { -- Example mapping to toggle outline
            { "go", "<cmd>Outline<CR>", desc = "Toggle outline" },
        },
        opts = {
            -- Your setup opts here
        },
    },
    -- 高亮光标下面的符号, A-n A-p上下切换
    {"RRethy/vim-illuminate"},
})

-- 启动插件
require('bufferline').setup({
    options = {
        numbers = "ordinal",
        indicator = {
            style = "icon"
        },
        diagnostic = "nvim_lsp"
    }
})
require('lualine').setup ()

require('autoclose').setup()
require('gitsigns').setup()

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls', 'cmake', 'glsl_analyzer'
    }
})

require("luasnip").setup({
    history = true,
    update_events = "TextChanged,TextChangedI",
    delete_check_events = "TextChanged,InsertLeave",
})
require("luasnip.loaders.from_vscode").lazy_load()

require("ibl").setup()
require('scrollview').setup({
    always_show = false,
    excluded_filetypes = {'NvimTree'},
    current_only = true,
    base = 'right',
    -- column = 80,
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
-- 启动mini的括号引号填充功能
require("mini.surround").setup()

