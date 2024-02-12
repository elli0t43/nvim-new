local config = function ()
    require("presence").setup({
        auto_update = true,
        neovim_image_text = "Stalking huh ? ",
        main_image = "file",
        debounce_timeout = 10,
        enable_line_number = false,
        show_time = true,
    })
end

return {
    'andweeb/presence.nvim',
    lazy = false,
    config = config,
}
