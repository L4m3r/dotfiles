return {
    { 'mbbill/undotree', config = function() vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle) end},
    { 'j-hui/fidget.nvim', config = function() require('fidget').setup() end},
}
