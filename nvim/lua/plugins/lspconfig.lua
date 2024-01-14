local Plugin = {'neovim/nvim-lspconfig'}

Plugin.dependencies = {
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'hrsh7th/cmp-nvim-lsp'},
}

function Plugin.config()
    local lspconfig = require('lspconfig')

    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp_cmds', {clear = true}),
        callback = function()
            local opts = {buffer = true}
            vim.keymap.set("n", "gd", function () vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>ca", function () vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end,
    })

    require('mason').setup()
    require('mason-lspconfig').setup({
        ensured_installed = {
            'rust_analyzer',
            'lua_ls',
        },
        handlers = {
            function(server)
                lspconfig[server].setup({})
            end,
            ['lua_ls'] = function ()
                require('plugins.lsp.lua_ls')
            end
        },
    })
end

return Plugin
