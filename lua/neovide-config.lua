if vim.g.neovide then
    vim.o.guifont = 'FiraMono Nerd Font Mono:h13'
    -- 动画速度加快
    vim.g.neovide_cursor_animation_length = 0.03
    vim.g.neovide_scroll_animation_length = 0.08
    vim.g.neovide_scroll_animation_far_lines = 1
    -- 键入时隐藏鼠标
    vim.g.neovide_hide_mouse_when_typing = true
    -- 关闭漂浮阴影
    vim.g.neovide_floating_shadow = false
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_refresh_rate = 144

    vim.g.neovide_cursor_vfx_mode = ""
end
