 -- indent blankline
return {
     "lukas-reineke/indent-blankline.nvim",
     main = "ibl",
     event = 'VeryLazy',
     config = {
         indent = {
             char = "│",
             smart_indent_cap = true,
         },
         whitespace = {
             highlight = {
                 "Whitespace",
                 "NonText"
             }
         },
         scope = {
             char = "┋",
             enabled = true,
             show_start = true,
             show_end = true,
         }

     },

}

