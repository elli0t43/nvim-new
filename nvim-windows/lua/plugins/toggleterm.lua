local config = function()
    require("toggleterm").setup({
        open_mapping = [[<c-\]],
        hide_numbers = true,
        autochdir = false,
        direction = 'float',
    })
end

return {
    'akinsho/toggleterm.nvim',
    version = "*",
    event = "InsertEnter",
    config = config,
}
