# IroncladDev's Neovim Configuration

My custom neovim configuration repo.

## Usage

Clone one of the branches into your `.config` directory.

You can use a custom conguration by setting the `NVIM_APPNAME` environment variable before running `nvim`.

```bash
$ NVIM_APPNAME=nvim-lazyvim nvim
```

Read more on switching neovim configurations [here](https://michaeluloth.com/neovim-switch-configs/)

## Branches

- [main](https://github.com/IroncladDev/nvim) - Hybrid Neovim config, contains all plugins across all Branches
- [rust](https://github.com/IroncladDev/nvim/tree/rust) - Optimized for Rust projects
- [typescript](https://github.com/IroncladDev/nvim/tree/typescript) - Optimized for Typescript projects

## Plugins

- [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim) - Linter & Formatter
- [mason](https://github.com/williamboman/mason.nvim) - Mason Packager for Neovim. Ensures the following are installed:

  - eslint-lsp
  - prettier
  - typescript-language-server
  - lua-language-server
  - prisma-language-server
  - tailwindcss-language-server
  - rust-analyzer

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
- [rust-tools](https://github.com/simrat39/rust-tools.nvim) and [rust.vim](https://github.com/rust-lang/rust.vim) - Rust LSP
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Enhanced Syntax Highlighting. Includes the following:

  - lua
  - javascript
  - typescript
  - tsx
  - html
  - css

## Custom Keybindings

- `Escape` - exit terminal mode
- `<leader>h` - open a horizontal split
- `<leader>v` - open a vertical split
- `<leader>H` - open a horizontal split with a terminal
- `<leader>V` - open a vertical split with a terminal

## Misc

- Floating neovim filetree for convenience
