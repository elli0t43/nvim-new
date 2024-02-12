local config = function()
    require("nvim-surround").setup({
        -- config
    })
end

return {
    'kylechui/nvim-surround',
    version = '*',
    event = "VeryLazy",
    config = config,
}
