require('nvim-tree').setup({
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = false,
    },

    -- 隐藏node_module文件夹
    filters = {
        dotfiles = true,
        custom = {'node_modules'},
    },

    view = {
        width = 40,
        side = 'left',
        -- 行号
        number = false,
        relativenumber = false,

        signcolumn = 'yes'
    },
    actions = {
        open_file = {
            quit_on_open = true,
            resize_window = true,
        },
    },
})
