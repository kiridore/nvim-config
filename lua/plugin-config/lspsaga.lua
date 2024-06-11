require('lspsaga').setup({
    symbol_in_winbar = {
        enable = true,
        hide_keyword = false,
        show_file = false,
        folder_level = 1,
        color_mode = true,
        delay = 100,
    },
    code_action = {
        num_shortcut = true,
        only_in_cursor = false,
        show_server_name = true,
        extend_gitsigns = false,
        keys = {
            quit = "q",
            exec = "<CR>",
        },
    },
    callhierarchy = {
        layout = "float",
        keys = {
            edit = "e",
            vsplit = "v",
            split = "s",
            tabe = "t",
            quit = "q",
            shuttle = "[]",
            toggle_or_req = "u",
            close = "<Esc>",
        },
    },
    rename = {
        in_select = false,
        auto_save = false,
        project_max_width = 0.5,
        project_max_height = 0.5,
        keys = {
            quit = "<C-c>",
            exec = "<CR>",
            select = "x",
        },
    },
    ui = {
        border = "single", -- Can be single, double, rounded, solid, shadow.
        devicon = true,
        title = true,
        code_action = '󰌵',
    },
    request_timeout = 3000,
})
