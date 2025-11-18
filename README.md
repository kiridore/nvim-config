# neovim 配置文档

## 第三方组件
### rg
+ 用于telescope插件全文搜索 [Github](https://github.com/BurntSushi/ripgrep)
### fd
+ 用于telescope插件文件搜索工具 [Github](https://github.com/sharkdp/fd)
### zig(Windows)
+ 编译Treesitter的所有解析器，在Win下必须 [Home](https://ziglang.org/)
### lazygit
+ 终端图形化Git工具 [Github](https://github.com/jesseduffield/lazygit)
### 文件批处理工具 sad
+ 用于全局替换 [github](https://github.com/ms-jpq/sad)
### 全局模糊搜索工具 fzf
+ 模糊搜索 [github](https://github.com/junegunn/fzf)
### MinGW32
+ 编译器、clangd均包含在其中
+ 使用msys2直接安装MinGW工具链
```
mingw-w64-x86_64-toolchain 包含了 gcc, gdb 一类的开发工具
mingw-w64-x86_64-cmake 用来组织项目
mingw-w64-x86_64-neovim 用来编辑
mingw-w64-x86_64-clang 提供了 clang-format 格式化工具
mingw-w64-x86_64-clang-tools-extra 提供了 clangd, clang-tidy 一类 lint 工具
```
[参考博客](https://www.rayalto.pro/2023/10/29/minimal-nvim-with-lsp-on-windows-mingw64-msys2/)
