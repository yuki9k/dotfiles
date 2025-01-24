return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            javascript = { "prettierd", "prettier", stop_after_first = true },
            typescript = { "prettierd", "prettier", stop_after_first = true },
            html = { "prettierd", "prettier", stop_after_first = true },
            css = { "prettierd", "prettier", stop_after_first = true },
            json = { "prettierd", "prettier", stop_after_first = true },
            php = { "php-cs-fixer" },
            cpp = { "clang-format" },
        },
        formatters = {
            stylua = {
                prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
            },
        },
        -- ["php-cs-fixer"] = {
        --     command = "php-cs-fixer",
        --     args = {
        --         "fix",
        --         "--rules=@PSR12", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
        --         "$FILENAME",
        --     },
        --     stdin = false,
        -- },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    },
}
