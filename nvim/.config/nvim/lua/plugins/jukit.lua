vim.g.jukit_mpl_style = '~/.local/share/nvim/lazy/vim-jukit/helpers/matplotlib-backend-kitty/backend.mplstyle'
vim.g.jukit_terminal = ''
vim.g.jukit_inline_plotting = 0

vim.g.jukit_output_new_os_window = 0
vim.g.jukit_outhist_new_os_window = 0

return {
    'luk400/vim-jukit',
    lazy = true,
    keys = {{"<leader>nn",':call jukit#convert#notebook_convert("jupyter-notebook")<cr>'},
            {"<leader>nh",':call jukit#splits#output_and_history()<cr>'},
            {"<leader>n",':call jukit#send#section(0)<cr>'},
            {"<leader>no",':call jukit#splits#output()<cr>'}}
}
