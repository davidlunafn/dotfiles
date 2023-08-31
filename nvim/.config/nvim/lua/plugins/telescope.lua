return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-lua/popup.nvim" },
        { "nvim-telescope/telescope-fzy-native.nvim" },
        { "kyazdani42/nvim-web-devicons" },
        { "nvim-telescope/telescope-file-browser.nvim" },
        { "nvim-telescope/telescope-ui-select.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    lazy=false,
    config = function ()
        require("david.telescope.setup")
        require("david.telescope.mappings")
    end
}
