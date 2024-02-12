local config = function()
    require('colorizer').setup({
        filetypes = {
            '*';
        },
        user_default_options = {
            mode = "background",
            names = false,
            virtualtext = "■",
        },
    })
end

return {
    "NvChad/nvim-colorizer.lua",
    event = "InsertEnter",
    config = config,
}

