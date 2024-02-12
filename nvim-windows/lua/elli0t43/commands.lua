local Remap = require("elli0t43.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local tnoremap = Remap.tnoremap
local vnoremap = Remap.vnoremap


local build_commands = {
    c = "!gcc -o %:p:r.o %",
    cpp = "!g++ -std=c++17 -Wall -O2 -o %:p:r.o %",
    rust = "!cargo build --release",
    go = "!go build",
}

local debug_build_commands = {
    c = "!gcc -g -o %:p:r.o %",
    cpp = "!g++ -std=c++17 -g -o %:p:r.o %",
    rust = "!cargo build",
    go = "!go build",
}

local run_commands = {
    c = "!%:p:r.o %",
    cpp = "!%:p:r.o %",
    rust = "!cargo run --release",
    go = "!go run .",
    javascript = "!node %",
    python = "!python3 %:p:r.py"
}

vim.api.nvim_create_user_command("Build", function()
    local filetype = vim.bo.filetype

    for file, command in pairs(build_commands) do
        if filetype == file then
            vim.cmd(command)
        break
        end
    end
end, {})


vim.api.nvim_create_user_command("DebugBuild", function()
    local filetype = vim.bo.filetype

    for file, command in pairs(debug_build_commands) do
        if filetype == file then
            vim.cmd(command)
        end
    end
end, {})


vim.api.nvim_create_user_command("Run", function()
    local filetype = vim.bo.filetype
    for file, command in pairs(run_commands) do
        if filetype == file then
            vim.cmd(command)
        end
    end
end, {})

vim.api.nvim_create_user_command("BuildRun", function()
    vim.cmd([[Build]])
    vim.cmd([[Run]])
end, {})

vim.api.nvim_create_user_command("NvimConfig", function()
    vim.cmd([[cd ~/.config/nvim]])
end, {})
