return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            icons_enabled = true,
            theme = "nightfly",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            always_show_tabline = true,
            globalstatus = false,
            refresh = {
                statusline = 100,
                tabline = 100,
                winbar = 100,
            },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = {
                {
                    "buffers",
                    symbols = {
                        modified = " ●", -- Text to show when the buffer is modified
                        alternate_file = "# ", -- Text to show to identify the alternate file
                        directory = "", -- Text to show when the buffer is a directory
                    },
                    hide_filename_extension = true,
                    buffers_color = {
                        -- Same values as the general color option can be used here.
                        active = "special", -- Color for active buffer.
                        -- inactive = "lualine_{section}_inactive", -- Color for inactive buffer.
                    },
                },
            },
            lualine_x = { "encoding", "fileformat", "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location", { "datetime", style = "%H:%M" } },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
    },
}
