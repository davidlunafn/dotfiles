return {
    { 
        "junegunn/fzf.vim" 
    },
    {
        "junegunn/fzf",
        build = function()
            vim.fn["fzf#install"]()
        end,
    },
    {
        "tpope/vim-dispatch",
        cmd = {"Make", "Dispatch"}
    },
    {
        "Raimondi/delimitMate"
    },
    {
        "lukas-reineke/indent-blankline.nvim"
    },
    {
        "tpope/vim-surround"
    },
    --"tpope/vim-repeat",
    --"tpope/vim-rhubarb",
    {
        "tpope/vim-eunuch"
    },
    --"adalessa/composer.nvim",
    {
        'nvim-lua/plenary.nvim'
    },
}
