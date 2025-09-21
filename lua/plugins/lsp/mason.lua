return {
    "mason-org/mason.nvim",
    dependencies = {
        "mason-org/mason-lspconfig.nvim",
        "jay-babu/mason-nvim-dap.nvim",
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-dap",

    },
    opts = {
        ui = {
            border = "rounded",
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        },
    },
    config = function(_, opts)
        require("mason").setup(opts)
        require("mason-lspconfig").setup({
            ensure_installed = {
                "clangd",
                "lua_ls",
                "pylsp",
                "rust_analyzer",
                "qmlls",
                "java_language_server",
            },
        })
        require("mason-nvim-dap").setup({
            ensure_installed = {
                "debugpy",
                "codelldb",
            },
            automatic_installation = true,
        })

        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                local options = { buffer = event.buf }

                vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", options)
                vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", options)
                vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", options)
                vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", options)
                vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<CR>", options)
                vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", options)
                vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", options)
                vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", options)
                vim.keymap.set("n", "<F3>", "<cmd>lua vim.lsp.buf.code_action()<CR>", options)
                vim.keymap.set({ "i", "x", "n", "s" }, "<f4>", function()
                    vim.lsp.buf.format({ async = false, timeout_ms = 1000 })
                end, options)
                vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", function()
                    vim.lsp.buf.format({ async = false, timeout_ms = 1000 })
                    vim.cmd("write")
                end)
            end,
        })

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })

        vim.lsp.config("pylsp", {
            settings = {
                pylsp = {
                    plugins = {
                        pyflakes = { enabled = false },
                        pycodestyle = { enabled = false },
                        autopep8 = { enabled = false },
                        yapf = { enabled = false },
                        mccabe = { enabled = false },
                        pylsp_mypy = { enabled = true },
                        pylsp_black = { enabled = true },
                        pylsp_isort = { enabled = true },
                    },
                },
            },
        })
    end
}
