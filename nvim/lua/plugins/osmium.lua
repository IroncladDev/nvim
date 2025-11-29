return {
    dir = "~/Desktop/osmium",
    -- "IroncladDev/osmium",
    config = function()
        require("osmium").setup({
            integrations = {
                gitsigns = true,
                telescope = true,
                indent_blankline = true,
                fff = true
            },
            transparent_bg = false,
            show_end_of_buffer = false,
        })

        vim.cmd.colorscheme("osmium")
    end,
}
