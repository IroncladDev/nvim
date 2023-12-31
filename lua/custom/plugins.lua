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
        "tailwindcss-language-server"
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
    event = "InsertEnter",
    ft = "markdown"
  },
  {
    "Pocco81/auto-save.nvim",
    event = { "InsertEnter", "TextChanged" },
    config = function()
      require("auto-save").setup({})
    end,
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "security find-generic-password -wa openai -s openai",
        openai_params = {
          model = "gpt-3.5-turbo-1106"
        }
      })
    end
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
    "AckslD/nvim-neoclip.lua",
    config = function()
      require('neoclip').setup()
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
    },
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      opts = require "plugins.configs.treesitter"
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
  }
}

return plugins

