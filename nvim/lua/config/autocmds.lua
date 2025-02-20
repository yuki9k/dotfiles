vim.api.nvim_create_autocmd({ "VimEnter", "VimResized" }, {
    desc = "Setup LSP hover window",
    callback = function()
        local width = math.floor(vim.o.columns * 0.8)
        local height = math.floor(vim.o.lines * 0.3)

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded",
            max_width = width,
            max_height = height,
        })
    end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function(args)
        local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
        local line_count = vim.api.nvim_buf_line_count(args.buf)
        if mark[1] > 0 and mark[1] <= line_count then
            vim.cmd('normal! g`"zz')
        end
    end,
})

-- Don't auto comment new line
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    callback = function()
        vim.cmd("set formatoptions-=cro")
    end,
})
