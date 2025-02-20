return {
  "slugbyte/lackluster.nvim",
  lazy = false,
  priority = 1000,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
    -- vim.cmd.colorscheme("lackluster")
    require("nvim-web-devicons").setup({
      color_icons = false,
      override = {
        ["default_icon"] = {
          color = require("lackluster").color.gray4,
          name = "Default",
        },
      },
    })
    vim.cmd.colorscheme("lackluster-hack") -- my favorite
    -- vim.cmd.colorscheme("lackluster-mint")
  end,
}
