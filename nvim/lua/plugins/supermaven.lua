return {
    "supermaven-inc/supermaven-nvim",
    lazy = false,
    config = function()
        require("supermaven-nvim").setup({
            keymaps = {
                accept_suggestion = "<C-d>",
                accept_word = "<C-s>",
                clear_suggestion = "<C-y>"
            },
            disable_inline_completion = false,
            color = {
                cterm = 244
            }
        })
    end,
}
