local config = function()
   require("nvim-tree").setup({
       view = {
            adaptive_size = false,
       },
       renderer = {
            full_name = true,
            indent_markers = {
                enable = true,
                icons = {
                    corner = "└",
                    edge = "│",
                    item = "│",
                    bottom = "─",
                    none = " ",
                },
            },
            special_files = {
                "Cargo.toml",
                "go.mod",
                "Makefile",
                "README.md",
                "readme.md",
            },
            highlight_opened_files = "icon",
            icons = {
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = false,
                    git = true,
                },
                modified_placement = "after",
                git_placement = "before",
                diagnostics_placement = "signcolumn",
                padding = " ",
                symlink_arrow = " ➛ ",
            },
            highlight_diagnostics = true,
       },
       diagnostics = {
            enable = true,
       },
   })
end

-- nvim tree 
return {
    "kyazdani42/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    config = config,
}


