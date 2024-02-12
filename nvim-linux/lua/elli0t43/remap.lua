local Remap = require("elli0t43.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local tnoremap = Remap.tnoremap
local vnoremap = Remap.vnoremap

local silent = { silent = true }

-- the classic jk = esc
inoremap("jk", "<Esc>")

-- pane navigation
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

-- Ctrl + S, Ctrl + Q for same and quite respectively
nnoremap("<C-s>", ":w<CR>")
nnoremap("<C-Q>", ":wq!<CR>")

-- Alt(meta key) + Backspace to delete one word and alt(meta key) + del to delete backwards
inoremap("<M-BS>", "<C-o>db")
inoremap("<M-Del", "<C-o>dw")

-- ctrl + backspace to delete 
inoremap("<C-BS>", "<C-o>db")

-- J K for moving lines up and down in visual mode
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- indenting lines together
vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- keep the cursor in the middle while searching
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

-- better paste
xnoremap("<leader>p", "\"_dP")

-- copy to system clipboard
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")

-- make the current file executable
nnoremap("<leader>x", "<cmd>!chmod +x %<CR>")

-- Select all
nnoremap("<C-a>", "gg<S-v>G")

-- terminal
nnoremap("<leader>tr", ":terminal<CR>")


-- PLUGIN HOT KEYS --

-- NVIM-TREE
nnoremap("<C-t>", ":NvimTreeToggle<CR>", silent)
nnoremap("<C-m>", ":NvimTreeFocus<CR>", silent)

-- WHICHKEY
nnoremap("<leader>w", ":WhichKey<CR>", silent)

-- TELESCOPE
nnoremap("<leader>ff", ":Telescope find_files<CR>", silent)
nnoremap("<leader>fg", ":Telescope live_grep<CR>", silent)
nnoremap("<leader>fb", ":Telescope buffers<CR>", silent)

-- COMMENT
nnoremap("<C-g>", "gcc")
vnoremap("<C-g>", "gcc")

-- LAZY
nnoremap("<leader>l", ":Lazy<CR>", silent)

-- COLORIZER
nnoremap("<leader>c", ":ColorizerAttachToBuffer<CR>", silent)

-- MASON
nnoremap("<leader>m", ":Mason<CR>", silent)

-- OUTLINE
nnoremap("<leader>ot", ":SymbolsOutlineOpen<CR>", silent)
nnoremap("<leader>Ot", ":SymbolsOutlineClose<CR>", silent)

-- GITSIGNS
nnoremap("<leader>gp", ":Gitsigns preview_hunk<CR>", silent)
nnoremap("<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", silent)

-- OBSIDIAN 
nnoremap("<leader>oo", ":ObsidianOpen<CR>", silent)
nnoremap("<leader>ob", ":ObsidianBacklinks<CR>", silent)
nnoremap("<leader>tt", ":ObsidianTemplate<CR>", silent)
