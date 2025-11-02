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
    config = function (_, opts)
        require("mason").setup(opts)
        require("mason-lspconfig").setup({
            ensure_installed = {
                "clangd",
                "lua_ls",
                "pylsp",
                "rust_analyzer",
                "texlab",
            },
        })
        require("mason-nvim-dap").setup({
            ensure_installed = {
                "debugpy",
                "codelldb",
            },
            automatic_installation = true,
        })


        -- ###
        -- LSP config section
        -- ###

        local home_dir = vim.fn.expand("~")

        vim.env.QML_IMPORT_PATH = "/usr/lib/qt6/qml"
        vim.lsp.config("qmlls", {
            cmd = {
                "qmlls",
                "-E",
            },
            filetypes = { "qml" },
            root_markers = { ".git" },
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
                            ignore = { "E501", "E231" },
                            maxLineLength = 120
                        },
                        yapf = { enabled = true },
                    }
                }
            }
        })

        local clang_cmd = {
            "clangd",
            "--fallback-style=webkit",
        }
        if vim.uv.os_uname().sysname == "Windows_NT" then
            table.insert(clang_cmd, "-target x86_64-pc-windows-gnu")
        end
        vim.lsp.config("clangd", {
            cmd = clang_cmd,
        })

        -- ###
        -- DAP config section
        -- ###

        local dap = require("dap")
        require("dap-python").setup("uv")

        vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939", bg = "#31353f" })
        vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })
        vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })

        vim.fn.sign_define("DapBreakpoint",
            { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })
        vim.fn.sign_define("DapBreakpointCondition",
            { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })
        vim.fn.sign_define("DapBreakpointRejected",
            { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })
        vim.fn.sign_define("DapLogPoint",
            { text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" })
        vim.fn.sign_define("DapStopped",
            { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })

        dap.adapters.codelldb = {
            type = "executable",
            command = home_dir .. "/.local/share/nvim/mason/bin/codelldb",
            name = "lldb",
        }

        dap.configurations.cpp = {
            name = "Launch file",
            type = "codelldb",
            request = "launch",
            program = function ()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
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
