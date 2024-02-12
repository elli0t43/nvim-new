local config = function()
    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = 'superuser3',
            component_separators = {left = '', right = ''},
            section_separators = {left = '', right = ''},
        },
        sections = {
            lualine_a = {
                'fileformat',
                'mode'
            },
            lualine_b = {
                'branch',
                'diff',
                { 'diagnostics', symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },

            },
            lualine_c = {{
                'filename',
                file_status = true, -- displays file status (readonly status, modified status)
                path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
            }},
            lualine_x = {
                'filetype'
            },
            lualine_y = {
                'location'
            },
            lualine_z = {
                'progress',
            }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {{
                'filename',
                file_status = true, -- displays file status (readonly status, modified status)
                path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
            }},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},

    }
end

-- lualine
return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    config = config,
}



