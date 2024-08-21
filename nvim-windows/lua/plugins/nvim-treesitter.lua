local config = function()
    require("nvim-treesitter.install").compilers = { 'zig' }
    require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
        },
        -- enable indentation
        indent = {
            enable = true
        },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = {
          enable = true,
        },
        prefer_git = false,
        -- ensure these language parsers are installed
        ensure_installed = {
          "json",
          "javascript",
          "tsx",
          "yaml",
          "html",
          "css",
          "markdown",
          "markdown_inline",
          "graphql",
          "bash",
          "lua",
          "vim",
          "dockerfile",
          "gitignore",
          "query",
          "go",
        },
      })
end


-- nvim treesitter 
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "windwp/nvim-ts-autotag",
    },
    lazy = false,
    config = config,
}



