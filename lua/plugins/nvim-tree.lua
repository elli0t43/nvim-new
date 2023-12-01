  -- nvim tree 
return {
    "kyazdani42/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    opts = {
      view = {
        side = "left",
        width = 40

      }
    }
}


