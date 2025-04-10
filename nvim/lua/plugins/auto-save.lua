return {
  "Pocco81/auto-save.nvim",
  event = { "InsertLeave", "TextChanged", "VeryLazy" },
  config = function()
    require("auto-save").setup({})
  end,
}
