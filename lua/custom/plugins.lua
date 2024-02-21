local plugins = {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "prettier",
        "typescript-language-server",
        "lua-language-server",
        "prisma-language-server",
        "tailwindcss-language-server",
        "rust-analyzer"
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "github/copilot.vim",
    cmd = "Copilot",
    event = "BufEnter",
    ft = "markdown"
  },
  {
    "Pocco81/auto-save.nvim",
    event = { "TextChanged" },
    config = function()
      require("auto-save").setup({})
    end,
  },
  {
    "samodostal/image.nvim",
    config = function()
      require("image").setup({
        render = {
          min_padding = 5,
          show_label = true,
          show_image_dimensions = true,
          use_dither = true,
          foreground_color = true,
          background_color = true
        },
        events = {
          update_on_nvim_resize = true,
        },
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "m00qek/baleia.nvim",
    },
    event = "VeryLazy",
  },
  {
    "rmagatti/auto-session",
    config = function()
      require('auto-session').setup {
        log_level = 'info',
        auto_session_enable_last_session = false,
        auto_session_enabled = true,
        auto_save_enabled = true,
        auto_restore_enabled = true,
        auto_session_use_git_branch = false,
        auto_session_allowed_dirs = {},
        auto_session_excluded_dirs = {}
      }
    end,
    lazy = false
  },
  {
    "andweeb/presence.nvim",
    config = function()
      require("presence").setup({
        auto_update = true,
      })
    end,
    lazy = false
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "html",
      "svg"
    },
    config = function()
      require('nvim-ts-autotag').setup()
    end,
    event = "VeryLazy"
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local opts = require "plugins.configs.treesitter"
      opts.ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css"
      }
      return opts
    end,
  },
  {
    "Djancyp/better-comments.nvim",
    config = function()
      require("better-comment").Setup({
        tags = {
          {
            name = "TODO",
            fg = "#348ceb",
            bg = "",
            bold = true,
            virtual_text = ""
          },
          {
            name = "?",
            fg = "#905fd4",
            bg = "",
            bold = true,
            virtual_text = ""
          },
          {
            name = "!",
            fg = "#ffcc6c",
            bg = "",
            bold = true,
            virtual_text = ""
          },
        }
      })
    end,
    event = "VeryLazy"
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require("crates")
      crates.setup(opts)
      crates.show()
    end,
  },
}

return plugins
