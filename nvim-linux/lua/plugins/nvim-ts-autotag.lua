local config = function() 
end

return {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = config,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    }
}
