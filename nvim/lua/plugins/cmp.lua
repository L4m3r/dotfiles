local Plugin = {'hrsh7th/nvim-cmp'}

Plugin.dependencies = {
    -- Sources
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},

    -- Snippets
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
}

function Plugin.config()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local cmp_select = {behavior = cmp.SelectBehavior.Select}
    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        sources = {
            {name = 'path'},
            {name = 'nvim_lsp'},
            {name = 'buffer', keyword_length = 3},
            {name = 'luasnip', keyword_length = 2},
        },
        mapping = {
            ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
            ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            ['<C-Space>'] = cmp.mapping.complete(),
        },
    })
end

return Plugin
