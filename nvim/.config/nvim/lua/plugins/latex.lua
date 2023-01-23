return {
    {
        'lervag/vimtex',
        lazy = true
    },

    {
        'f3fora/nvim-texlabconfig',
        -- ft = { 'tex', 'bib' }, -- for lazy loading
        build = 'go build',
        lazy = true
        -- run = 'go build -o ~/.bin/' if e.g. ~/.bin/ is in $PATH
    },

}
