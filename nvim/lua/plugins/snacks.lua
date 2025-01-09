return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        dashboard = {
            enabled = true,
            preset = {
                keys = {
                    { icon = " ", key = "b", desc = "Browse Files", action = ":Telescope file_browser" },
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = "󰐕 ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    {
                        icon = " ",
                        key = "g",
                        desc = "Find Text",
                        action = ":lua Snacks.dashboard.pick('live_grep')",
                    },
                    { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    {
                        icon = " ",
                        key = "r",
                        desc = "Recent Files",
                        action = ":lua Snacks.dashboard.pick('oldfiles')",
                    },
                    -- {
                    --     icon = "CFG ",
                    --     key = "c",
                    --     desc = "Config",
                    --     action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
                    -- },
                    -- { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    -- {
                    --     icon = "󰒲 ",
                    --     key = "L",
                    --     desc = "Lazy",
                    --     action = ":Lazy",
                    --     enabled = package.loaded.lazy ~= nil,
                    -- },
                    { icon = "󰩈 ", key = "q", desc = "Quit", action = ":qa" },
                },
            },
            sections = {
                {
                    {
                        section = "terminal",
                        cmd = "chafa ~/.config/nvim/jinx.jpg --format symbols --symbols vhalf --size 60x17; sleep .1",
                        height = 17,
                        padding = 0,
                    },
                },
                {
                    pane = 2,
                    { section = "keys", gap = 1, padding = 1 },
                    { section = "startup" },
                },
            },
            formats = {
                key = function(item)
                    return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
                end,
            },
        },
        bigfile = { enabled = true },
        indent = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scroll = { enabled = true },
        words = { enabled = true },
    },
}
