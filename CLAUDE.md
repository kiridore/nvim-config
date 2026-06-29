# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management. The environment targets **Windows (MSYS2/MinGW)** with conditional Linux fallback.

## Architecture

```
init.lua                    # Entry point — requires modules in load order
lua/
├── basic.lua               # Core editor settings (indent, search, UI, diagnostic)
├── plugin.lua              # lazy.nvim bootstrap + ALL plugin specs + inline setups
├── keybindings.lua         # All keymaps, organized by category (editing, window, LSP, DAP, Git, Rust)
├── lsp_config.lua          # mason + lspconfig: Lua, C/C++, Rust, Python, CMake, GLSL
├── neovide-config.lua      # GUI-only settings (font, animations, refresh rate)
├── godot.lua               # Godot engine LSP over TCP (port 6005), auto-starts nvim server
├── dap_config/
│   ├── init.lua            # DAP entry point — loads adapters then configs
│   ├── dap_ui.lua          # nvim-dap-ui with auto-open/close hooks
│   ├── adapters/
│   │   ├── cpptools.lua    # Microsoft cpptools debug adapter (Windows path)
│   │   └── gdb.lua         # GDB DAP adapter
│   └── configs/
│       ├── cpp.lua         # C++ launch config (cppdbg)
│       └── rust.lua        # Rust launch config (GDB)
└── plugin-config/
    ├── nvim-tree.lua       # File explorer settings
    ├── nvim-treesitter.lua # Parser install + highlight/indent/rainbow; zig on Windows, gcc on Linux
    ├── cmp.lua             # Completion: sources, formatting, cmdline completion
    ├── lspsaga.lua         # LSP UI (rename, code action, call hierarchy, winbar)
    ├── glance.lua          # LSP references/definitions preview window
    ├── crate.lua           # crates.nvim (Rust dependency management)
    ├── illuminate.lua
    ├── nvim-task.lua
    ├── marks.lua
    └── copilot.lua
```

## Key conventions

- **Leader key**: `<Space>`
- **Colorscheme**: `everforest` (dark), applied via catppuccin config block in `plugin.lua:46`
- **Indent**: 4 spaces, expandtab enabled, autoindent + smartindent
- **Terminal**: PowerShell via toggleterm on Windows
- **Windows-first**: treesitter uses `zig` compiler on Windows, `gcc` on Linux; Godot pipe uses `127.0.0.1:6666` on Windows vs Unix socket on Linux

## Working with the config

| Action | Command |
|--------|---------|
| Reload config | `:Lazy reload` or restart nvim |
| Sync/install plugins | `:Lazy sync` |
| Update plugins | `:Lazy update` |
| Install TS parsers | `:TSInstall <lang>` |
| Install LSP servers | `:Mason` (opens UI) |

## External dependencies (from README)

Required by core plugins: `ripgrep` (telescope grep), `fd` (telescope file search), `zig` (treesitter compiler on Windows), `luarocks` (lazy.nvim).

Recommended: `lazygit`, `fzf`, `sad` (batch replace), and the MSYS2/MinGW toolchain (`mingw-w64-x86_64-toolchain`, `mingw-w64-x86_64-cmake`, `mingw-w64-x86_64-clang`, `mingw-w64-x86_64-clang-tools-extra`).
