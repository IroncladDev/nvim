return {
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = false,
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            term_colors = true,
            transparent_background = true,
            custom_highlights = function(colors)
                return {
                    NormalFloat = { bg = colors.surface0, fg = colors.text },
                    FloatBorder = { bg = colors.surface0, fg = colors.text },
                    GitSignsAddPreview = { bg = colors.surface0 },
                    BlinkCmpMenu = { bg = colors.crust },
                    BlinkCmpMenuSelection = { bg = colors.surface0 },
                    BlinkCmpDoc = { bg = colors.mantle },
                    BlinkCmpDocSeparator = { bg = colors.mantle },
                    BlinkCmpDocBorder = { bg = colors.mantle },
                }
            end,
            integrations = {
                blink_cmp = true,
                treesitter = true,
                nvimtree = true,
                gitsigns = true,
                fidget = false,
                indent_blankline = true,
                mason = false,
                telescope = {
                    enabled = true,
                    style = "nvchad",
                },
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                        ok = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                        ok = { "underline" },
                    },
                },
                which_key = false,
            },
        })

        -- setup must be called before loading
        vim.cmd.colorscheme("catppuccin")
    end,
}
