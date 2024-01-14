local Plugin = {'nvim-telescope/telescope.nvim'}

Plugin.branch = '0.1.x'

Plugin.dependencies = {
    {'nvim-lua/plenary.nvim'},
}

function Plugin.config()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
end

return Plugin
