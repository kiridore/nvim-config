local border = function(hl)
    return {
        { "┌", hl },
        { "─", hl },
        { "┐", hl },
        { "│", hl },
        { "┘", hl },
        { "─", hl },
        { "└", hl },
        { "│", hl },
    }
end

-- Set up nvim-cmp.
local cmp = require'cmp'
cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        completion = {
            border = border("PmenuBorder"),
            winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:PmenuSel",
            scrollbar = true,
        },
        documentation = {
            border = border("CmpDocBorder"),
            winhighlight = "Normal:CmpDoc",
        },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp', max_item_count = 350 },
        { name = 'luasnip' }, -- For luasnip users.
        { name = 'treesitter' },
        {
            name = 'buffer',
            option = {
                get_bufnrs = function ()
                    return vim.api.nvim_list_bufs()
                end,
            }
        },
        { name = 'path' },
    }),
    experimental = {
        -- ghost_text = {
        --     hl_group = "Whitespace",
        -- }
        ghost_text = false,
    },
    performance = {
        async_budget = 1,
        max_view_entries = 120,
    },
    matching = {
        disallow_partial_fuzzy_matching = false,
    },
    formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, vim_item)
            -- load lspkind icons
            vim_item.kind =
            string.format("%s", vim_item.kind or "")

            vim_item.menu = setmetatable({
                cmp_tabnine = "[TN]",
                copilot = "[CPLT]",
                buffer = "[BUF]",
                orgmode = "[ORG]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[LUA]",
                path = "[PATH]",
                tmux = "[TMUX]",
                treesitter = "[TS]",
                latex_symbols = "[LTEX]",
                luasnip = "[SNIP]",
                spell = "[SPELL]",
                }, {
                    __index = function()
                        return "[BTN]" -- builtin/unknown source names
                    end,
            })[entry.source.name]

            local label = vim_item.abbr
            local max_length = 60
            local lable_without_space = string.gsub(label, "^%s+", "")
            local truncated_label = vim.fn.strcharpart(lable_without_space, 0, max_length)
            if truncated_label ~= lable_without_space then
                vim_item.abbr = truncated_label .. "..."
            else
                vim_item.abbr = truncated_label
            end

            return vim_item
        end,
    },
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]-- 

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
            { name = 'cmdline' }
        }),
    matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
vim.lsp.config('clangd', {
    capabilities = capabilities
})
vim.lsp.enable('clangd')

vim.lsp.config('lua_ls', {
    capabilities = capabilities
})
vim.lsp.enable('lua_ls')
