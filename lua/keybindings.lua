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


-- rename
map("n", "<leader>r", ":lua vim.lsp.buf.rename<CR>", opt)
-- code action
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opt)
-- go to definition
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opt)
-- show hover
map("n", "gh", ":lua vim.lsp.buf.hover()<CR>", opt)
-- format
map("n", "<leader>=", ":lua vim.lsp.buf.format { async = true }<CR>", opt)

-- terminal
map("t", "<ESC><ESC>", "<C-\\><C-n>", opt)
map("n", "<C-\\>", "<Cmd>ToggleTerm direction=horizontal<CR>", opt)
map("i", "<C-\\>", "<ESC><Cmd>ToggleTerm direction=horizontal<CR>", opt)

local _toggle_lazygit = function()
	if vim.fn.executable("lazygit") == 1 then
		if not _lazygit then
			_lazygit = require("toggleterm.terminal").Terminal:new({
				cmd = "lazygit",
				direction = "float",
				close_on_exit = true,
				hidden = true,
			})
		end
		_lazygit:toggle()
	else
		vim.notify("Command [lazygit] not found!", vim.log.levels.ERROR, { title = "toggleterm.nvim" })
	end
end
vim.keymap.set("n", "<leader>gg", _toggle_lazygit, opt)

-- trouble
map("n", "gt", ":TroubleToggle<CR>", opt)

-- bufferline
map("n", "<A-i>", ":BufferLineCycleNext<CR>", opt)
map("n", "<A-o>", ":BufferLineCyclePrev<CR>", opt)

map("n", "<A-1>", ":BufferLineGoToBuffer 1<CR>", opt)
map("n", "<A-2>", ":BufferLineGoToBuffer 2<CR>", opt)
map("n", "<A-3>", ":BufferLineGoToBuffer 3<CR>", opt)
map("n", "<A-4>", ":BufferLineGoToBuffer 4<CR>", opt)
map("n", "<A-5>", ":BufferLineGoToBuffer 5<CR>", opt)
map("n", "<A-6>", ":BufferLineGoToBuffer 6<CR>", opt)
map("n", "<A-7>", ":BufferLineGoToBuffer 7<CR>", opt)
map("n", "<A-8>", ":BufferLineGoToBuffer 8<CR>", opt)
map("n", "<A-9>", ":BufferLineGoToBuffer 9<CR>", opt)
