return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      icons_enabled = false,
      theme = "lackluster",
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
            -- modified = " ●", -- Text to show when the buffer is modified
            modified = " *", -- Text to show when the buffer is modified
            alternate_file = "# ", -- Text to show to identify the alternate file
            directory = "", -- Text to show when the buffer is a directory
          },
          buffers_color = {
            active = "special", -- Color for active buffer.
          },
        },
      },
      lualine_x = {
        "encoding",
        {
          "fileformat",
          symbols = {
            unix = "", -- e712
            dos = "󰨡", -- e70f
            mac = "󰀶", -- e711
          },
        },
        "filetype",
      },
      lualine_y = { "location" },
      lualine_z = { { "datetime", style = "%H:%M" } },
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
