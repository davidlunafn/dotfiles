local ls = require "luasnip"

-- ls.parser.parse_snippet(<text>, <VS**** style snippet >)
ls.snippet = {
    all = {
        -- Available in any filetype
        ls.parser.parse_snippet("expand", "-- this is what was expanded!"),
    },

    lua = {
        -- lua specific snippets ho here
        ls.parser.parse_snippet("bb", "\begin{$1}\n\t $2 \n \\end{$1}")
    },
}


