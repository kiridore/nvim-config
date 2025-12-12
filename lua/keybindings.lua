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

map("v", "<leader>y", "\"+y", opt)
map("v", "<leader>p", "\"+p", opt)

-- 搜索时填充very magic标识
map("n", "/", "/\\v", opt)
map("v", "/", "/\\v", opt)

-- alt + hjkl  窗口之间跳转
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)

-- 窗口比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)

----------plugin---------

--- nvim-tree
map("n", "<leader>m", ":NvimTreeToggle<CR>", opt)

--- telescope
map('n', '<leader>e', ":Telescope find_files<CR>", opt)
map('n', '<leader>fg', ":Telescope live_grep<CR>", opt)
map('n', '<leader>fb', ":Telescope buffers<CR>", opt)
map('n', '<leader>fh', ":Telescope help_tags<CR>", opt)

map("n", "<leader>r", "<Cmd>Lspsaga rename<CR>", opt)
map("n", "ga", "<Cmd>Lspsaga code_action<CR>", opt)
map("n", "gd", "<Cmd>Glance definitions<CR>", opt)
map("n", "gD", "<Cmd>Lspsaga goto_definition<CR>", opt)
map("n", "gh", "<Cmd>Glance references<CR>", opt)
map("n", "gm", "<Cmd>Glance implementations<CR>", opt)
map("n", "gci", "<Cmd>Lspsaga incoming_calls<CR>", opt)
map("n", "gco", "<Cmd>Lspsaga outgoing_calls<CR>", opt)
map("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opt)

-- format
map("n", "<leader>=", ":lua vim.lsp.buf.format { async = true }<CR>", opt)

-- terminal
map("t", "<ESC><ESC>", "<C-\\><C-n>", opt)
map("n", "<C-\\>", "<Cmd>ToggleTerm direction=horizontal<CR>", opt)
map("i", "<C-\\>", "<ESC><Cmd>ToggleTerm direction=horizontal<CR>", opt)

vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", opt)
vim.keymap.set("n", "<leader>gf", ":LazyGitFilterCurrentFile<CR>", opt)

-- trouble
map("n", "<leader>xx", "<Cmd>Trouble diagnostics toggle <CR>", opt)
map("n", "<leader>xl", "<Cmd>Trouble lsp toggle win.position=right<CR>", opt)
map("n", "<leader>xs", "<Cmd>Trouble lsp_document_symbols toggle win.position=right<CR>", opt)

-- bufferline
-- map("n", "<A-o>", ":BufferLineCycleNext<CR>", opt)
-- map("n", "<A-i>", ":BufferLineCyclePrev<CR>", opt)
--
-- map("n", "<A-1>", ":BufferLineGoToBuffer 1<CR>", opt)
-- map("n", "<A-2>", ":BufferLineGoToBuffer 2<CR>", opt)
-- map("n", "<A-3>", ":BufferLineGoToBuffer 3<CR>", opt)
-- map("n", "<A-4>", ":BufferLineGoToBuffer 4<CR>", opt)
-- map("n", "<A-5>", ":BufferLineGoToBuffer 5<CR>", opt)
-- map("n", "<A-6>", ":BufferLineGoToBuffer 6<CR>", opt)
-- map("n", "<A-7>", ":BufferLineGoToBuffer 7<CR>", opt)
-- map("n", "<A-8>", ":BufferLineGoToBuffer 8<CR>", opt)
-- map("n", "<A-9>", ":BufferLineGoToBuffer 9<CR>", opt)

-- delete buffers
map("n", "<A-q>", "<Cmd>BufDel<CR>", opt)

-- 加速jk
map('n', 'j', '<Plug>(accelerated_jk_gj)', opt)
map('n', 'k', '<Plug>(accelerated_jk_gk)', opt)

-- hop better motion
map("n", "<leader>w", "<Cmd>HopWordMW<CR>", opt)
map("n", "<leader>j", "<Cmd>HopLineMW<CR>", opt)
map("n", "<leader>k", "<Cmd>HopLineMW<CR>", opt)
map("n", "<leader>c", "<Cmd>HopChar1MW<CR>", opt)
map("n", "<leader>C", "<Cmd>HopChar2MW<CR>", opt)

map("v", "<leader>w", "<Cmd>HopWordMW<CR>", opt)
map("v", "<leader>j", "<Cmd>HopLineMW<CR>", opt)
map("v", "<leader>k", "<Cmd>HopLineMW<CR>", opt)
map("v", "<leader>c", "<Cmd>HopChar1MW<CR>", opt)
map("v", "<leader>C", "<Cmd>HopChar2MW<CR>", opt)

-- dap
vim.keymap.set("n", "<F6>", function() require("dap").continue() end, opt)
vim.keymap.set("n", "<F7>", function() require("dap").terminate() end, opt)
vim.keymap.set("n", "<F8>", function() require("dap").toggle_breakpoint() end, opt)
vim.keymap.set("n", "<F9>", function() require("dap").step_into() end, opt)
vim.keymap.set("n", "<F10>", function() require("dap").step_out() end, opt)
vim.keymap.set("n", "<F11>", function() require("dap").step_over() end, opt)


vim.keymap.set("n", "<leader>db", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
    opt)
vim.keymap.set("n", "<leader>dc", function() require("dap").run_to_cursor() end, opt)
vim.keymap.set("n", "<leader>dl", function() require("dap").run_last() end, opt)
vim.keymap.set("n", "<leader>do", function() require("dap").open() end, opt) -- open repl

-- clever-f
map("n", ";", "<Plug>(clever-f-repeat-forward)", opt)
map("n", ",", "<Plug>(clever-f-repeat-back)", opt)

-- dap-ui
-- map("n", "<A-k>", "<Cmd>lua require(\"dapui\").eval()<CR>", opt)

vim.keymap.set("n", "<leader>gm", require("telescope.builtin").marks, opt)

