if vim.g.neovide then
    vim.o.guifont = 'FiraMono Nerd Font Mono:h13'
    -- 动画速度加快
    vim.g.neovide_cursor_animation_length = 0.03
    vim.g.neovide_scroll_animation_length = 0.1
    -- 键入时隐藏鼠标
    vim.g.neovide_hide_mouse_when_typing = true
    -- 关闭漂浮阴影
    vim.g.neovide_floating_shadow = false
end
