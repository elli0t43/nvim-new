local config = function()
    require("obsidian").setup({
        workspaces = {
            {
                name = "Notes",
                path = "D:/Notes",
            }
        },
        completion = {
            nvim_cmp = true,
            min_chars = 3,
            new_notes_location = "current_dir",

            -- Whether to add the note ID during completion.
            -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
            -- Mutually exclusive with 'prepend_note_path' and 'use_path_only'.
            prepend_note_id = true,

            -- Whether to add the note path during completion.
            -- E.g. "[[Foo" completes to "[[notes/foo|Foo]]" assuming "notes/foo.md" is the path of the note.
            -- Mutually exclusive with 'prepend_note_id' and 'use_path_only'.
            prepend_note_path = false,

            -- Whether to only use paths during completion.
            -- E.g. "[[Foo" completes to "[[notes/foo]]" assuming "notes/foo.md" is the path of the note.
            -- Mutually exclusive with 'prepend_note_id' and 'prepend_note_path'.
            use_path_only = false,

        },
        attachments = {
            -- default folder to place images in via `:ObsidianPasteImg`
            img_folder = "Attachments",
        },
        templates = {
            subdir = "templates"
        },
        use_advanced_uri = false,
        finder = "telescope.nvim",
        sort_by = "modified",
        sort_reversed = true,
        open_notes_in = "current",
        yaml_parser = "native",
        ui = {
            enable = true,
            tags = { h1_group = "ObsidianTag" },
        },
    })
end

return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = config,
}
