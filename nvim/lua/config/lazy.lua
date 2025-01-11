-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
-- Puts lazy into the runtimepath for nvim
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    -- Begin with setting up mason and lspconfig before loading rest of plugins
    { "williamboman/mason.nvim", opts = {} },
    { "williamboman/mason-lspconfig.nvim", opts = {} },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "ms-jpq/coq_nvim", branch = "coq" },
            { "ms-jpq/coq.artifacts", branch = "artifacts" },
            -- { 'ms-jpq/coq.thirdparty', branch = "3p" },
        },
        init = function()
            -- vim.g.coq_settings = {
            --     auto_start = true, -- if you want to start COQ at startup
            --     keymap = { pre_select = true },
            --     display = { ghost_text = { enabled = false } },
            -- }

            -- THIS IS TO GET AUTOPAIRS TO WORK WITH COQ
            local remap = vim.api.nvim_set_keymap

            local npairs = require("nvim-autopairs")

            npairs.setup({ map_bs = false, map_cr = false })

            vim.g.coq_settings = {
                auto_start = true,
                keymap = { recommended = false, pre_select = true },
                display = { ghost_text = { enabled = false } },
            }

            -- these mappings are coq recommended mappings unrelated to nvim-autopairs
            remap("i", "<esc>", [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
            remap("i", "<c-c>", [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
            remap("i", "<tab>", [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
            remap("i", "<s-tab>", [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

            -- skip it, if you use another global object
            _G.MUtils = {}

            MUtils.CR = function()
                if vim.fn.pumvisible() ~= 0 then
                    if vim.fn.complete_info({ "selected" }).selected ~= -1 then
                        return npairs.esc("<c-y>")
                    else
                        return npairs.esc("<c-e>") .. npairs.autopairs_cr()
                    end
                else
                    return npairs.autopairs_cr()
                end
            end
            remap("i", "<cr>", "v:lua.MUtils.CR()", { expr = true, noremap = true })

            MUtils.BS = function()
                if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ "mode" }).mode == "eval" then
                    return npairs.esc("<c-e>") .. npairs.autopairs_bs()
                else
                    return npairs.autopairs_bs()
                end
            end
            remap("i", "<bs>", "v:lua.MUtils.BS()", { expr = true, noremap = true })
        end,
        opts = {
            servers = {
                emmet_language_server = { filetypes = { "html" } },
                lua_ls = {
                    on_init = function(client)
                        if client.workspace_folders then
                            local path = client.workspace_folders[1].name
                            if
                                vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc")
                            then
                                return
                            end
                        end

                        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                            runtime = {
                                -- Tell the language server which version of Lua you're using
                                -- (most likely LuaJIT in the case of Neovim)
                                version = "LuaJIT",
                            },
                            -- Make the server aware of Neovim runtime files
                            workspace = {
                                checkThirdParty = false,
                                library = {
                                    vim.env.VIMRUNTIME,
                                    "${3rd}/love2d/library",
                                    -- Depending on the usage, you might want to add additional paths here.
                                    -- "${3rd}/luv/library"
                                    -- "${3rd}/busted/library",
                                },
                            },
                        })
                    end,
                    settings = {
                        Lua = {},
                    },
                },
                ts_ls = {
                    settings = {
                        typescript = {
                            inlayHints = {
                                includeInlayParameterNameHints = "all",
                                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                                includeInlayFunctionParameterTypeHints = true,
                                includeInlayVariableTypeHints = true,
                                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                                includeInlayPropertyDeclarationTypeHints = true,
                                includeInlayFunctionLikeReturnTypeHints = true,
                                includeInlayEnumMemberValueHints = true,
                            },
                        },
                        javascript = {
                            inlayHints = {
                                includeInlayParameterNameHints = "all",
                                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                                includeInlayFunctionParameterTypeHints = true,
                                includeInlayVariableTypeHints = true,
                                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                                includeInlayPropertyDeclarationTypeHints = true,
                                includeInlayFunctionLikeReturnTypeHints = true,
                                includeInlayEnumMemberValueHints = true,
                            },
                        },
                    },
                },
                html = {},
                htmx = {
                    filetypes = { "html" },
                },
                intelephense = {
                    cmd = { "intelephense", "--stdio" },
                    filetypes = { "php" },
                    single_file_support = true,
                },
                cssls = {},
                jsonls = {},
                clangd = {},
            },
        },
        config = function(_, opts)
            local lspconfig = require("lspconfig")
            local coq = require("coq")
            for server, config in pairs(opts.servers) do
                -- config.capabilities.textDocument.foldingRange = {
                --     dynamicRegistration = false,
                --     lineFoldingOnly = true,
                -- }

                lspconfig[server].setup(coq.lsp_ensure_capabilities(config))
            end

            require("ufo").setup({})
        end,
    },
    { import = "plugins" },
    { import = "plugins.themes" },
})
