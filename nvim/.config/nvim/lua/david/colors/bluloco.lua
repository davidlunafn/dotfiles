local ok, tokyonight = pcall(require, "bluloco")
if not ok then
    return
end

local function setup()
    tokyonight.setup({
        style="dark"
    })
    vim.cmd.colorscheme("bluloco-dark")
end

return {
    setup = setup,
}
