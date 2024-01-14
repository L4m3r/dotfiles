local catppuccin = {'catppuccin/nvim'}

catppuccin.name = 'catppuccin'

function catppuccin.config ()
    vim.cmd('colorscheme catppuccin-macchiato')
end

return catppuccin
