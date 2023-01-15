local ok, githubtheme = pcall(require, "github-theme")
if not ok then
    return
end

local function setup()
    githubtheme.setup({
        theme_style = "dark",

        -- Change the "hint" color to the "orange" color, and make the "error" color bright red
        colors = {hint = "orange", error = "#ff0000"},

        -- Overwrite the highlight groups
        overrides = function(c)
            return {
                htmlTag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
                DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
                -- this will remove the highlight groups
                TSField = {},
            }
        end
    })
    vim.cmd.colorscheme("github_dark")
end

return {
    setup = setup,
}
