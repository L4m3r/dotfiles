local Plugin = {'nvim-treesitter/nvim-treesitter'}

Plugin.dependencies = {
    {'nvim-treesitter/nvim-treesitter-textobjects'}
}

Plugin.build = ':TSUpdate'

Plugin.opts = {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "cpp", "python" },
    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            }
        },
    },
}

function Plugin.config(name, opts)
    require('nvim-treesitter.configs').setup(opts)
end

return Plugin

