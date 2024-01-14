local Plugin = {'lervag/vimtex'}

function Plugin.config()
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
        callback = 1,
        continuous = 1,
        executable = "latexmk",
        engine = 'lualatex',
        options = {
            "-shell-escape",
            "-verbose",
            "-file-line-error",
            "-synctex=1",
            "-interaction=nonstopmode",
        },
    }
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_quickfix_mode = 1
    vim.g.vimtex_compiler_latexmk_engines = {
        _ = '-lualatex',
        xelatex = '-lualatex',
    }
end

return Plugin
