return {
    'projekt0n/github-nvim-theme',
    priority=1000,
    config = function()
        require("github-theme").setup({
            theme_style = "dark"
        })
        vim.cmd.colorscheme("github_dark")
    end
}
