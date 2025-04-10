return {
	"nmac427/guess-indent.nvim",
	event = "VeryLazy",
  config = function()
    require("guess-indent").setup({
      auto_cmd = true,
      override_editorconfig = true,
      on_tab_options = {
        ["expandtab"] = true,
      },
      on_space_options = {
        ["expandtab"] = true,
        ["tabstop"] = "detected",
        ["softtabstop"] = "detected",
        ["shiftwidth"] = "detected",
      },
    })
  end,
}
