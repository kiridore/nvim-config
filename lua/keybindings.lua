-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {
    noremap = true, -- 避免递归绑定
}

-- 代理函数
local map = vim.api.nvim_set_keymap

-- 复制粘贴
map("n", "<leader>y", "\"+y", opt)
map("n", "<leader>p", "\"+p", opt)

-- 保存快捷键
map("n", "<leader>w", ";w<CR>", opt)
map("n", "<leader>wq", ";wqa!<CR>", opt)

-- 搜索时填充very magic标识
map("n", "/", "/\\v", opt)
map("v", "/", "/\\v", opt)

-- 上下滚动浏览
map("n", "<C-j>", "5j", opt)
map("n", "<C-k>", "5k", opt)
map("v", "<C-j>", "5j", opt)
map("v", "<C-k>", "5k", opt)

-- alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- <leader> + hjkl 窗口之间跳转
map("n", "<leader>h", "<C-w>h", opt)
map("n", "<leader>j", "<C-w>j", opt)
map("n", "<leader>k", "<C-w>k", opt)
map("n", "<leader>l", "<C-w>l", opt)


----------plugin---------

--- nvim-tree
map("n", "<leader>m", ":NvimTreeToggle<CR>", opt)

--- telescope
map('n', '<leader>e', ":Telescope find_files<CR>", opt)
map('n', '<leader>fg', ":Telescope live_grep<CR>", opt)
map('n', '<leader>fb', ":Telescope buffers<CR>", opt)
map('n', '<leader>fh', ":Telescope help_tags<CR>", opt)


