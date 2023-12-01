local config = function()
    require("alpha").setup(
        require'alpha.themes.dashboard'.config
    )
end

return {
    "goolord/alpha-nvim",
    lazy = false,
    config = config,
}
