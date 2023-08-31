return {
    "folke/trouble.nvim",
    lazy=false,
    priority=1000,
    dependencies = "kyazdani42/nvim-web-devicons",
    keys = { { "<leader>oo", "<cmd>TroubleToggle<cr>" } },
    config = true,
}
