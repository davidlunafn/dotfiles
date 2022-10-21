-- for shorthand usage
local nm = require("neo-minimap")

-- will reload your neo-minimap config file on save
-- works only when you have only 1 neo-minimap config file
nm.source_on_save("~/.config/nvim/after/plugin/neo-minimap.lua") -- optional

nm.set({"zi", "zo", "zu"}, { "*.tex" }, {
     events = { "BufEnter" },

     -- lua table, values inside can be type `string` or `number`
     -- accepts multiple treesitter queries, corresponse to each keymap,
     -- if you press "keymap1", minimap will start with first query,
     -- if you press "keymap2", minimap will start with second query,
     -- you can have empty query table option if you want to use regex only
    query = { },

    -- optional
	regex = { -- lua table, values inside can be type `table` or `number`
		{ [[ \section{*} ]], [[ \subsection{*}]], [[ \subsubsection{*} ]]}, -- first set of regexes
        { [[ \begin{figure} ]]},
        { [[ \begin{align*} ]], [[ \begin{table*} ]]}, -- no regex
	},
    -- you can have empty regex option if you want to use Treesitter queries only

    -- optional
    search_patterns = {
		{ "vim_regex", "<C-j>", true }, -- jump to the next instance of "vim_regex"
		{ "vim_regex", "<C-k>", false }, -- jump to the previous instance of "vim_regex"
	},

    auto_jump = true, -- optional, defaults to `true`, auto jump when move cursor

    -- other options
    width = 44, -- optional, defaults to 44, width of the minimap
    height = 12, -- optional, defaults to 12, height of the minimap
    hl_group = "my_hl_group", -- highlight group of virtual text, optional, defaults to "DiagnosticWarn"
    
    open_win_opts = {}, -- optional, for setting custom `nvim_open_win` options
    win_opts = {}, -- optional, for setting custom `nvim_win_set_option` options
    
    -- change minimap's height with <C-h>
    -- this means default minimap height is 12
    -- minimap height will change to 36 after pressing <C-h>
    height_toggle = { 12, 36 },
})


-- Python
nm.set({"zi", "zo"}, { "python" }, {
    query = {},
    regex ={
    { [[class.*:$]] },
    { [[def.*(]] }
  }
})
