local config = function()
    require("Comment").setup({
        padding = true,
        sticky = true,
        toggler = {
            line = 'gcc',
            block = 'gbc'
        },
        opleader = {
            line = 'gc',
            block = 'gb',
        },
        extra = {
            above = 'gc0',
            below = 'gco',
            eol = 'gcA',
        },
        mappings = {
            basic = true,
            extra = true,
        }
    })
end

return {
    'numToStr/Comment.nvim',
    event = "InsertEnter",
    config = config,
}
