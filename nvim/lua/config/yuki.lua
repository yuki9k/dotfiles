-- KEYMAPS

-- Motions
vim.keymap.set({ "n", "v" }, "J", "}")
vim.keymap.set({ "n", "v" }, "H", "^")
vim.keymap.set({ "n", "v" }, "L", "$")
vim.keymap.set({ "n", "v" }, "K", "{")
vim.keymap.set({ "n", "v" }, "[[", "?\\v\\{|\\(|\\<\\<cr>") -- Backward search for opening brackets
vim.keymap.set({ "n", "v" }, "]]", "/\\v\\}|\\)|\\>\\<cr>") -- Forward search for closing brackets
vim.keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz")
vim.keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<esc>", "<cmd>noh<cr>")

-- Terminal
-- vim.keymap.set("n", "<leader>tt", "<cmd>:vsplit term://%:p:h//zsh<cr>i")
vim.keymap.set("n", "<leader>tt", "<cmd>:ToggleTerm dir=%:p:h<cr>")
vim.keymap.set("t", "<esc>", "<C-\\><C-n><C-w>h", { silent = true })
-- vim.keymap.set({ "n", "v" }, "J", "6j")
-- vim.keymap.set({ "n", "v" }, "K", "6k")
-- vim.keymap.set({ "n", "v", "i" }, "<C-c>", "<esc>")

-- LSP
-- Replaced by Trouble but kept here because why not
-- vim.keymap.set("n", "<leader>ss", function()
--     vim.lsp.buf.hover()
-- end, { desc = "Display hover information about symbol" })
-- vim.keymap.set("n", "<leader>sg", function()
--     vim.lsp.buf.definition()
-- end, { desc = "Jump to symbol definition" })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set(
    "n",
    "<leader>pf",
    ":Telescope file_browser path=%:p:h select_buffer=true<cr>",
    { desc = "Telescope file browser", noremap = true, silent = true }
)
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
-- TODO quickswitch between buffers

-- Windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { remap = true })

-- Other
vim.keymap.set("n", "<leader>img", "<cmd>ViewImage<cr>", { desc = "View image with Chafa" })
vim.keymap.set("n", "<leader>C", "<cmd>Cheatsheet<cr>", { desc = "Open Cheatsheet" })
vim.keymap.set("n", "<leader>nh", function()
    Snacks.notifier.show_history()
end, { desc = "Show notification history" })

-- OPTIONS

-- Indenting
vim.opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.opt.softtabstop = 2 -- Number of spaces inserted instead of a TAB character
vim.opt.shiftwidth = 2 -- Number of spaces inserted when indenting
vim.opt.smartindent = false
vim.opt.breakindent = true

-- UI
vim.opt.cmdheight = 1
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.cursorline = true
vim.opt.showmode = false
-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Folding
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.foldmethod = "manual"
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- Other
vim.opt.undofile = true
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"
