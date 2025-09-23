return {
    "mason-org/mason.nvim",
    dependencies = {
        "mason-org/mason-lspconfig.nvim",
        "jay-babu/mason-nvim-dap.nvim",

        "neovim/nvim-lspconfig",

        "mfussenegger/nvim-dap",
        "igorlfs/nvim-dap-view",
        "theHamsta/nvim-dap-virtual-text",

        "mfussenegger/nvim-dap-python",
        "mfussenegger/nvim-jdtls",
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
                "jdtls",
            },
        })
        require("mason-nvim-dap").setup({
            ensure_installed = {
                "debugpy",
                "codelldb",
                -- "java-debug-adapter",
                -- "java-test",
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
                vim.keymap.set({ "i", "x", "n", "s" }, "<F4>", function()
                    vim.lsp.buf.format({ async = false, timeout_ms = 1000 })
                end, options)
                vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", function()
                    vim.lsp.buf.format({ async = false, timeout_ms = 1000 })
                    vim.cmd("write")
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
                end)
            end,
        })

        -- LSP Config
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

        -- local debug_bundle = {
        --     "/home/FrogWrangler/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar",
        --     "/home/FrogWrangler/.local/share/nvim/mason/share/java-test/com.microsoft.java.test.plugin.jar",
        -- }
        --
        -- vim.lsp.config("jdtls", {
        --     settings = {
        --         java = {
        --             -- Custom eclipse.jdt.ls options go here
        --         },
        --     },
        --     init_options = {
        --         bundles = debug_bundle,
        --     },
        -- })

        -- Language specific dap configurations
        require("dap-python").setup("uv")

        -- Dapview Config
        require("nvim-dap-virtual-text").setup({})
        require("dap-view").setup({
            winbar = {
                sections = { "breakpoints", "watches", "threads", "repl", "console" },
                default_section = "breakpoints",

                controls = { enabled = true },
            },
        })
    end
}
