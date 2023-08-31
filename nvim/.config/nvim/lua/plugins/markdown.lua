return {
   {
        "iamcco/markdown-preview.nvim",
        lazy=true,
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    { 
        "iamcco/markdown-preview.nvim", 
        lazy=true,
        build= "cd app && npm install", 
        config = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, 
    },



}
