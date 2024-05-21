local options = {
    -- Tab and Indentation
	autoindent = true,
	smartindent = true,
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    wrap = true,

    -- Search 
    incsearch = true,

    -- Appearance
	number = true,
	relativenumber = true,
	termguicolors = true,
	showtabline = 0,

    -- Swap and backup
	swapfile = false,
    backup = false,
    -- undofile = true,

    -- Mouse stuff
    mouse = "a",
    scrolloff = 10,

    -- Autocompletion stuff
    completeopt = "menuone,noinsert,noselect",

    -- split and stuff
    splitbelow = true,
    splitright = true,
    autochdir = false,


}

for option, value in pairs(options) do
	vim.opt[option] = value
end
