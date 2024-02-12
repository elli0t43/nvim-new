local config = function()
    require("gitsigns").setup({
        signs = {
            add = { text = '▏' },
            change = { text = '▏' },
            delete = { text = '_' },
            topdelete = { text = '-' },
            changedelete = { text = '~' },
            untracked = { text = '▏' },
        },
        signcolumn = true,
        current_line_blame_formatter = '<author>, <author_time:%d-%m-%Y> - <summary>',
        update_debounce = 100,
    })
end

return {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = config,
}
