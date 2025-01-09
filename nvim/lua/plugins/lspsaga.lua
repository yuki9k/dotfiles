return {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    opts = {
        lightbulb = { virtual_text = false },
        ui = { code_action = "󰌶" },
    },
    dependencies = {
        "nvim-treesitter/nvim-treesitter", -- optional
        "nvim-tree/nvim-web-devicons", -- optional
    },
}
