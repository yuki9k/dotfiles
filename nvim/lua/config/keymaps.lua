-- Motions
vim.keymap.set({ "n", "v" }, "J", "}")
vim.keymap.set({ "n", "v" }, "H", "^")
vim.keymap.set({ "n", "v" }, "L", "$")
vim.keymap.set({ "n", "v" }, "K", "{")
vim.keymap.set({ "n", "v" }, "]]", "/\\v\\}|\\)|\\>\\<cr>") -- Forward search for closing brackets
vim.keymap.set({ "n", "v" }, "[[", "?\\v\\{|\\(|\\<\\<cr>") -- Backward search for opening brackets
vim.keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz")
vim.keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<esc>", "<cmd>noh<cr>")
-- vim.keymap.set({ "n", "v" }, "J", "6j")
-- vim.keymap.set({ "n", "v" }, "K", "6k")

-- Terminal
vim.keymap.set("n", "<leader>tt", "<cmd>:ToggleTerm dir=%:p:h<cr>")
vim.keymap.set("t", "<esc>", "<C-\\><C-n><C-w>h", { silent = true })

-- LSP
vim.keymap.set("n", "<leader>ss", "<cmd>Lspsaga hover_doc<cr>", { desc = "Display hover information about symbol" })
vim.keymap.set("n", "<leader>sd", "<cmd>Lspsaga peek_definition<cr>", { desc = "Peek definition" })
vim.keymap.set("n", "<leader>sc", "<cmd>Lspsaga incoming_calls<cr>", { desc = "Incoming calls" })
vim.keymap.set("n", "<leader>sC", "<cmd>Lspsaga outgoing_calls<cr>", { desc = "Outgoing calls" })
vim.keymap.set("n", "<leader>so", "<cmd>Lspsaga outline<cr>", { desc = "Show outline" })
vim.keymap.set("n", "<leader>sa", "<cmd>Lspsaga code_action<cr>", { desc = "Show code action" })
vim.keymap.set("n", "<leader>dd", "<cmd>Lspsaga diagnostic_jump_next<cr>", { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>dD", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { desc = "Previous diagnostic" })
vim.keymap.set("n", "<leader>rr", function()
    vim.lsp.buf.rename()
end, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>sS", function()
    vim.lsp.buf.signature_help()
end, { desc = "Show signature" })

-- fzf-lua
vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "FzfLua find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua grep<cr>", { desc = "FzfLua grep" })
vim.keymap.set("n", "<leader>fG", "<cmd>FzfLua live_grep<cr>", { desc = "FzfLua live grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "FzfLua buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>FzfLua helptags<cr>", { desc = "FzfLua help" })
vim.keymap.set("n", "<leader>ft", "<cmd>FzfLua treesitter<cr>", { desc = "FzfLua treesitter" })

-- Oil
vim.keymap.set("n", "<leader>pf", "<cmd>Oil --float<cr>", { desc = "Open Oil", noremap = true, silent = true })

-- Folding
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

-- Buffers
vim.keymap.set("n", "<leader>bd", function()
    Snacks.bufdelete()
end, { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bl", "<cmd>buffers<cr>", { desc = "List buffers" })
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<C-n>", "<cmd>bnext<cr>")
vim.keymap.set("n", "<C-p>", "<cmd>bprevious<cr>")
vim.api.nvim_set_keymap("n", "<C-q>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-q>", "<cmd>b#<cr>")

-- Windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { remap = true })

-- Other
vim.keymap.set("n", "<leader>nh", function()
    Snacks.notifier.show_history()
end, { desc = "Show notification history" })
vim.keymap.set("v", "yc", '"+y')
vim.keymap.set(
    "n",
    "<leader>hl",
    "<cmd>TSHighlightCapturesUnderCursor<cr>",
    { desc = "Show treesitter and syntax highlight groups under the cursor" }
)
-- Open/close Markdown preview
vim.keymap.set("n", "<leader>pp", "<cmd>PeekOpen<cr>", { desc = "Open Markdown preview" })
vim.keymap.set("n", "<leader>pP", "<cmd>PeekClose<cr>", { desc = "Close Markdown preview" })
