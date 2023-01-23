return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
    },
    keys = require('david.harpoon').keymaps,
    config = function ()
        require("david.harpoon").setup()
    end
}
