let g:jukit_shell_cmd = 'ipython3'
let g:jukit_terminal = 'kitty'
let g:jukit_auto_output_hist = 0
let g:jukit_use_tcomment = 0
let g:jukit_comment_mark = '#'
let g:jukit_mappings = 1
let g:jukit_mappings_ext_enabled = "*"
let g:jukit_convert_overwrite_default = -1
let g:jukit_convert_open_default = -1


let g:jukit_savefig_dpi = 150
let g:jukit_mpl_block = 1
let g:jukit_custom_backend = -1
let g:jukit_mpl_style = jukit#util#plugin_path() . '/helpers/matplotlib-backend-kitty/backend.mplstyle'
let g:jukit_inline_plotting = 1

let g:jukit_layout = {
    \'split': 'horizontal',
    \'p1': 0.6, 
    \'val': [
        \'file_content',
        \{
            \'split': 'vertical',
            \'p1': 0.6,
            \'val': ['output', 'output_history']
        \}
    \]
\}

