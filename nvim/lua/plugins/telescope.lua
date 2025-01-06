return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("telescope").setup({
            extensions = {
                file_browser = {
                    -- disables netrw and use telescope-file-browser in its place
                    hijack_netrw = true,
                    mappings = {
                        ["i"] = {
                            -- your custom insert mode mappings
                        },
                        ["n"] = {
                            -- your custom normal mode mappings
                        },
                    },
                },
            },
            defaults = {
                mappings = {
                    i = {
                        -- ["<C-k>"] = require("telescope.actions").move_selection_previous, -- Move up
                        -- ["<C-j>"] = require("telescope.actions").move_selection_next, -- Move down
                        -- ["<C-p>"] = false, -- Unmap default <C-p>
                        -- ["<C-n>"] = false, -- Unmap default <C-n>
                        -- ["<C-c>"] = require("telescope.actions").close,
                    },
                    n = {
                        -- ["<C-k>"] = require("telescope.actions").move_selection_previous, -- Move up
                        -- ["<C-j>"] = require("telescope.actions").move_selection_next, -- Move down
                        -- ["<C-c>"] = require("telescope.actions").close,
                    },
                },
            },
        })
        local telescope = require("telescope")
        telescope.load_extension("fzf")
        telescope.load_extension("file_browser")
    end,
}
