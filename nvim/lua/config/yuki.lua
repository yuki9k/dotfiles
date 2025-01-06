local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set(
    "n",
    "<leader>pf",
    ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
    { desc = "Telescope file browser", noremap = true, silent = true }
)
vim.keymap.set("n", "<leader>img", "<cmd>ViewImage<CR>", { desc = "View image with Chafa" })
vim.keymap.set("n", "<leader>nh", function()
    Snacks.notifier.show_history()
end, { desc = "Show notification history" })
vim.keymap.set("n", "<leader>C", "<cmd>Cheatsheet<CR>", { desc = "Open Cheatsheet" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<C-n>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<C-p>", "<cmd>bprevious<CR>")
vim.api.nvim_set_keymap("n", "<C-q>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-q>", "<cmd>b#<CR>")
vim.keymap.set("n", "<leader>bl", "<cmd>buffers<CR>", { desc = "List buffers" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<C-c>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set({ "n", "v" }, "H", "^")
vim.keymap.set({ "n", "v" }, "L", "$")
-- vim.keymap.set("n", "J", "6j")
-- vim.keymap.set("n", "K", "6k")
vim.keymap.set({ "n", "v" }, "J", "}")
vim.keymap.set({ "n", "v" }, "K", "{")
vim.keymap.set({ "n", "v" }, "[[", "?\\v\\{|\\(|\\<\\<CR>") -- Backward search for opening brackets
vim.keymap.set({ "n", "v" }, "]]", "/\\v\\}|\\)|\\>\\<CR>") -- Forward search for closing brackets
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.opt.cmdheight = 1
vim.opt.termguicolors = true
vim.opt.smartindent = false
vim.opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.opt.softtabstop = 2 -- Number of spaces inserted instead of a TAB character
vim.opt.shiftwidth = 2 -- Number of spaces inserted when indenting
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.scrolloff = 10
vim.opt.cursorline = true
vim.opt.showmode = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
-- vim.opt.signcolumn = "yes"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
