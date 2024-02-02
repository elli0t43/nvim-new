local config = function()
    local telescope = require('telescope')
    telescope.setup({
        defaults = {
            mappings = {
                i = {
                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous",
                }
            }
        }
    })
end
-- nvim telescope
return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',  -- or branch = '0.1.x',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = config,
}
