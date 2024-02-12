local config = function()
    local lsp_zero = require('lsp-zero')
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
    end)
    local lsp_zero = require('lsp-zero')

    lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
    end)

    -- MASON STUFF --
    -- see :help lsp-zero-guide:integrate-with-mason-nvim
    -- to learn how to use mason.nvim with lsp-zero
    require('mason').setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    })
    require('mason-lspconfig').setup({
        ensure_installed = {
            "clangd", -- C/CPP
            "dockerls", -- Docker
            "gopls", -- Golang
            "html", -- HTML
            "tsserver", -- JS/TS
            "lua_ls", -- Lua
            "pylyzer", -- Python
            "bashls", -- Bash
            "cssls", -- css 
            "jsonls", -- JSON
            "yamlls", -- YAML
        },
        handlers = {
            lsp_zero.default_setup,

            -- Lua_ls config
            lua_ls = function()
                local lua_opts = lsp_zero.nvim_lua_ls()
                require('lspconfig').lua_ls.setup({
                    lua_opts,
                    capabilities = capabilities,
                })
            end,

            -- gopls config
            gopls = function()
                require('lspconfig').gopls.setup({
                    capabilities = capabilities,
                    settings = {
                        gopls = {
                            analyses = {
                                unusedparams = true,
                            },
                            staticcheck = true,
                            gofumpt = true,
                        },
                        cmd = {
                            "gopls"
                        },
                        filetypes = {
                            "go",
                            "gomod",
                            "gowork",
                            "gotmpl"
                        },
                        single_file_support = true,
                    },
                })
            end,

            -- clangd config
            clangd = function ()
                require("lspconfig").clangd.setup({
                    capabilities = capabilities,
                    single_file_support = true,
                })
            end,

            -- tsserver config
            tsserver = function ()
                require("lspconfig").tsserver.setup({
                    capabilities = capabilities,
                    single_file_support = true,
                })
            end,

            -- bashls config
            bashls = function ()
                require("lspconfig").bashls.setup({
                    capabilities = capabilities,
                    single_file_support = true,
                })
            end
        },
    })

    -- CMP STUFF--
    local cmp = require('cmp')
    local cmp_select = {behavior = cmp.SelectBehavior.Select}
    local luasnip = require('luasnip')
    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        sources = {
            { name = 'path' }, -- file system paths
            { name = 'nvim_lsp' }, -- LSP
            { name = 'buffer', max_item_count = 8 },
            { name = 'luasnip' },
        },
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert({
            ['<C-p>'] = cmp.mapping.scroll_docs(4),
            ['<C-n>'] = cmp.mapping.scroll_docs(-4),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            }),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_locally_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.locally_jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
        }),
    })

    -- SNIPPETS STUFF --
    local types = require("luasnip.util.types")
    require("luasnip.loaders.from_lua").load({
        paths = "~/.config/nvim/luasnippets"
    })
    require("luasnip.loaders.from_vscode").lazy_load()
    require('luasnip').setup({
        update_events = {"TextChanged", "TextChangedI"},
        ext_opts = {
            [types.choiceNode] = {
                active = {
                    virt_text = { { "<-", "Error" } },
                },
            },
        },
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {}),
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {}),
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    })

end

-- lsp zero
return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    event = "VeryLazy",
    dependencies = {
        {'williamboman/mason.nvim'}, -- lsp, formatters, linters etc package manager
        {'williamboman/mason-lspconfig.nvim'}, -- bridges mason with lspconfig
        {'neovim/nvim-lspconfig'}, -- the great lspconfig
        {'hrsh7th/cmp-nvim-lsp'}, -- completion reccomendations for lsps attached to current buffer
        {'hrsh7th/nvim-cmp'}, -- helps set the window that essentially shows you the lsp
        {'L3MON4D3/LuaSnip'}, -- snippet engine
        {'saadparwaiz1/cmp_luasnip'}, -- completion for snippet engine
        {'rafamadriz/friendly-snippets'} -- vscode like snippets
    },
    config = config,
}
