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
    { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, lazy = false, opts = ... },
    { "EdenEast/nightfox.nvim",   priority = 1000, lazy = false },
    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000, -- make sure to load this before all the other start plugins
        -- Optional; default configuration will be used if setup isn't called.
        config = function()
            require("everforest").setup({})
        end,
    },
    { 'shaunsingh/nord.nvim',             priority = 1000,   lazy = false },
    { 'mellow-theme/mellow.nvim',         priority = 1000,   lazy = false }, -- 素色黑白
    { 'slugbyte/lackluster.nvim',         priority = 1000,   lazy = false }, -- 纯黑白
    { 'aktersnurra/no-clown-fiesta.nvim', priority = 1000,   lazy = false }, -- 偏素的冷色
    { 'NLKNguyen/papercolor-theme',       priority = 1000,   lazy = false }, -- 柔和彩色
    { 'hardselius/warlock',               priority = 1000,   lazy = false }, -- 真·纯黑白
    { "rose-pine/neovim",                 name = "rose-pine" },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false,
        config =
            function()
                require("catppuccin").setup()
                ---- 暂时把颜色修改写在这里，保证bufferlline插件加载时一定能获取到
                vim.cmd([[colorscheme catppuccin]])
            end
    },
    -- 更好的开始界面
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.startify'.config)
        end
    },
    -- -- 更好的buffer line
    -- {
    --     'akinsho/bufferline.nvim',
    --     version = "*",
    --     dependencies = 'nvim-tree/nvim-web-devicons'
    -- },
    -- lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    -- 自动括号补全
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    -- 更现代的surround
    {
        "kylechui/nvim-surround",
        version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
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
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
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
        opts = {}
    },
    -- 代码高亮
    { "nvim-treesitter/nvim-treesitter",        build = ":TSUpdate" },
    -- 显示上下文
    { "nvim-treesitter/nvim-treesitter-context" },
    -- 彩色括号
    { "hiphish/rainbow-delimiters.nvim" },
    -- Git支持 :Git
    { "tpope/vim-fugitive" },
    -- LSP
    { 'neovim/nvim-lspconfig' },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    -- Git Line
    { 'lewis6991/gitsigns.nvim' },
    -- 代码补全
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },
    { 'ray-x/cmp-treesitter' },
    { 'saadparwaiz1/cmp_luasnip' },
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
        config = function(_, opts) require 'lsp_signature'.setup(opts) end
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
        opts = {},
        lazy = false,
    },
    -- blankline
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    -- 滚动条
    { "dstein64/nvim-scrollview" },
    -- 大文件编辑优化
    { "LunarVim/bigfile.nvim" },
    -- git diff 查看 VDI无法运行
    { "sindrets/diffview.nvim" },
    -- 更好的terminal
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true
    },
    -- 更清晰的F\f\T\t
    { "rhysd/clever-f.vim" },
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
    { 'mfussenegger/nvim-dap' },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
    },
    { "jay-babu/mason-nvim-dap.nvim" },
    -- 删除当前buffer
    { 'ojroques/nvim-bufdel' },
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
        opts = {},
    },
    {
        "smoka7/hop.nvim",
        lazy = true,
        version = "*",
        event = { "CursorHold", "CursorHoldI" },
        config = {},
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
    { "RRethy/vim-illuminate" },
    -- 自动高亮颜色值
    { "norcalli/nvim-colorizer.lua" },
    -- AI
    { "zbirenbaum/copilot.lua" },
    -- 更好的书签管理工具
    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
        opts = {},
    },
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        priority = 1000,
        config = function()
            require('tiny-inline-diagnostic').setup()
            vim.diagnostic.config({ virtual_text = false }) -- Disable default virtual text
        end
    },
    -- LazyGit插件支持
    {
        "kdheepak/lazygit.nvim",
        lazy = false,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope").load_extension("lazygit")
        end,
    },
    -- neovim内解决git冲突
    -- {
    --     "StackInTheWild/headhunter.nvim",
    --     config = function()
    --         require("headhunter").setup({
    --             keys = false
    --         })
    --     end,
    -- },
    -- flutter
    {
        'nvim-flutter/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
        config = true,
    },
})

-- -- 启动插件
-- require('bufferline').setup({
--     options = {
--         numbers = "ordinal",
--         indicator = {
--             style = "icon"
--         },
--         diagnostic = "nvim_lsp",
--         offsets = {
--             {
--                 filetype = "NvimTree",
--                 text = "File Explorer",
--                 text_align = "center",
--                 separator = true
--             }
--         },
--     }
-- })
require('lualine').setup()

require('nvim-autopairs').setup({
    disable_filetype = { "TelescopePrompt", "vim" },
})

require('gitsigns').setup({
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
    },
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
    excluded_filetypes = { 'NvimTree' },
    current_only = true,
    base = 'right',
    -- column = 80,
    signs_on_startup = { 'all' },
    diagnostics_severities = { vim.diagnostic.severity.ERROR }
})
require("bigfile").setup {
    filesize = 2,      -- size of the file in MiB, the plugin round file sizes to the closest MiB
    pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
    features = {       -- features to disable
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

-- 设置默认termianl
require("toggleterm").setup({
    shell = "powershell.exe"
})

require("colorizer").setup()

require("tiny-inline-diagnostic").setup({
    -- Style preset for diagnostic messages
    -- Available options: "modern", "classic", "minimal", "powerline", "ghost", "simple", "nonerdfont", "amongus"
    preset = "powerline",
})

require("flutter-tools").setup {} -- use defaults
