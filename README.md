# Rust Neovim Configuration

This configuration is optimized specifically for Rust development.

## Installation

```bash
cd ~/.config
git clone --single-branch --branch rust https://github.com/IroncladDev/nvim nvim-rust
```

## Usage

```bash
NVIM_APPNAME=nvim-rust nvim
```

## Plugins

- [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim) - Linter & Formatter
- [mason](https://github.com/williamboman/mason.nvim) - Mason Packager for Neovim. Ensures the following are installed:

  - prettier
  - lua-language-server
  - rust-analyzer

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP config for Neovim, includes Lua LSP
- [copilot](https://github.com/github/copilot.vim) - Github Copilot

  - I enabled copilot to work with markdown files

- [auto-save](https://github.com/Pocco81/auto-save.nvim) - Auto-save plugin when you exit insert mode
- [presence](https://github.com/andweeb/presence.nvim) - Discord RPC
- [auto-session](https://github.com/rmgatti/auto-session) - Auto save neovim sessions
- [rust-tools](https://github.com/simrat39/rust-tools.nvim) and [rust.vim](https://github.com/rust-lang/rust.vim) - Rust LSP
