-- plugin/nvim-cmp

local cmp = require 'cmp'

-- completions

cmp.setup({
    snippet = {
        expand = function(args)
            require 'luasnip'.lsp_expand(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item()),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item()),
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),

    sources = cmp.config.sources({
        { name = 'nvim_lsp', priority = 0 },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
        -- { name = 'path' }
    }),

    experimental = {
        ghost_text = true
    },

    formatting = {
        format = function (_, vim_item)
            vim_item.kind = string.sub(vim_item.kind, 1, 20)
            return vim_item
        end
    },

    window = {
        completion = {
            max_width = 50
        }
    }
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
