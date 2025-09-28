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
                "java-debug-adapter",
                "java-test"
            },
            automatic_installation = true,
        })


        -- ###
        -- LSP config section
        -- ###

        local home_dir = vim.fn.expand("~")

        vim.lsp.config("jdtls", {
            settings = {
                java = {

                },
            },
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
                configurationSources = { "flake8" },
                formatCommand = { "black" },
                pylsp = {
                    plugins = {
                        pyflakes = { enabled = true },
                        pycodestyle = {
                            enabled = true,
                            ignore = { 'E501', 'E231' },
                            maxLineLength = 120
                        },
                        yapf = { enabled = true }
                    }
                }
            }
        })

        vim.lsp.config("clangd", {
            cmd = {
                "clangd",
                "--fallback-style=webkit",
            }
        })

        -- ###
        -- DAP config section
        -- ###

        local dap = require('dap')
        require("dap-python").setup("uv")

        dap.adapters.codelldb = {
            type = "executable",
            command = home_dir .. "/.local/share/nvim/mason/bin/codelldb",
            name = "lldb",
        }

        dap.configurations.cpp = {
            name = "Launch file",
            type = "codelldb",
            request = "launch",
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
        }

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
