---@type ChadrcConfig
local M = {}

M.ui = { 
  theme = 'catppuccin',
  -- transparency = true,
  statusline = {
    theme = "vscode_colored",
    separator_style = "default"
  }
}
M.plugins = "custom.plugins"

return M
