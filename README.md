# XSH Workspace

A personalized coding workspace configuration for macOS, featuring a custom **Neovim** setup and **Ghostty** terminal integration.

## Neovim Configuration

This is a lightweight, modular Neovim configuration built from scratch (migrated from LazyVim), designed for performance and maintainability.

### Key Features

*   **Plugin Manager**: [lazy.nvim](https://github.com/folke/lazy.nvim)
*   **Modular Structure**: Plugins are organized by category for easy maintenance:
    *   **UI**: `lua/plugins/ui/` (Catppuccin, Lualine, Noice, Dashboard, etc.)
    *   **Editor**: `lua/plugins/editor/` (Neo-tree, Telescope, Toggleterm, Git tools, etc.)
    *   **Coding**: `lua/plugins/coding/` (LSP, Blink.cmp, Treesitter, Rustaceanvim, AI, etc.)

### Core Plugins

*   **Completion**: [blink.cmp](https://github.com/saghen/blink.cmp) - High-performance completion engine.
*   **LSP**: Native LSP with [Mason](https://github.com/williamboman/mason.nvim) for easy tool management.
*   **File Explorer**: [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim).
*   **Fuzzy Finder**: [Telescope](https://github.com/nvim-telescope/telescope.nvim).
*   **Terminal**: [Toggleterm](https://github.com/akinsho/toggleterm.nvim).
*   **Rust**: [Rustaceanvim](https://github.com/mrcjkb/rustaceanvim) for a full-featured Rust IDE experience.
*   **AI**: [CodeCompanion](https://github.com/olimorris/codecompanion.nvim) with Gemini adapter.

## Setup

1.  **Prerequisites**: MacOS, Neovim >= 0.10, Ghostty (optional but recommended).
2.  **Installation**:
    Execute the commands in [init.sh](init.sh) to set up the environment.
    ```bash
    ./init.sh
    ```
3.  **Usage**:
    Open `nvim` and `lazy.nvim` will automatically install all plugins.

## Structure

```text
nvim/
├── init.lua              # Entry point
├── lua/
│   ├── config/           # Core config (options, keymaps, autocmds)
│   └── plugins/          # Plugin specifications
│       ├── coding/       # LSP, Completion, AI
│       ├── editor/       # Navigation, Git, Terminal
│       └── ui/           # Theme, Statusline, Decorations
```
