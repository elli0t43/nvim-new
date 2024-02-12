return {
    "RRethy/vim-illuminate",
    event = "InsertEnter",
    config = function ()
        require('illuminate').configure({
            providers = {
                'treesitter',
                'regex',
                'lsp',
            },
        })
    end
}
