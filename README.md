# Typescript Neovim Configuration

This configuration is optimized specifically for Typescript devalopment. Works well with Javascript and React (TSX/JSX) as well.

## Installation

```bash
cd ~/.config
git clone --single-branch --branch typescript https://github.com/IroncladDev/nvim nvim-typescript
```

## Usage

```bash
NVIM_APPNAME=nvim-typescript nvim
```

## Plugins

- [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim) - Linter & Formatter
- [mason](https://github.com/williamboman/mason.nvim) - Mason Packager for Neovim. Ensures the following are installed:

  - eslint-lsp
  - prettier
  - typescript-language-server
  - lua-language-server
  - prisma-language-server
  - tailwindcss-language-server

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP config for Neovim
  - Includes Lua, Typescript, Javascript, HTML, CSS, and Prisma LSP
- [copilot](https://github.com/github/copilot.vim) - Github Copilot
  - I enabled copilot to work with markdown files
- [auto-save](https://github.com/Pocco81/auto-save.nvim) - Auto-save plugin when you exit insert mode
- [image](https://github.com/samodostal/image.nvim) - ASCII image previewer
- [presence](https://github.com/andweeb/presence.nvim) - Discord RPC
- [auto-session](https://github.com/rmgatti/auto-session) - Auto save neovim sessions
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) - Auto close HTML/JSX tags and handle renames.
- [better-comments](https://github.com/Djancyp/better-comments.nvim) - Highlight TODOs and others
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Enhanced Syntax Highlighting. Includes the following:

  - lua
  - javascript
  - typescript
  - tsx
  - html
  - css
