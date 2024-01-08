local config = function()
    require("harpoon").setup({

    })
end

return {
    'ThePrimeagen/harpoon',
    branch = "harpoon2",
    dependencies = {
        { "nvim-lua/plenary.nvim" }
    },
    event = "InsertEnter",
    config = config,
}
