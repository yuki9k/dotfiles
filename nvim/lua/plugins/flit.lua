return {
    "ggandor/flit.nvim",
    dependencies = {
        "ggandor/leap.nvim",
        dependencies = "tpope/vim-repeat",
        init = function()
            require("leap").create_default_mappings()
        end,
    },
    opts = {},
}
