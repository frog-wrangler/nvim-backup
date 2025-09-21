return {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "nvim-tree/nvim-web-devicons",
        "onsails/lspkind.nvim",
    },
    opts = {
        signature = { enabled = true },
        cmdline = {
            keymap = { preset = "inherit" },
            completion = { menu = { auto_show = true } },
        },
        keymap = {
            ["<C-Space>"] = { "hide" },
            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
            ["<CR>"] = { "accept", "fallback" },
        },
        completion = {
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
            },
            menu = {
                draw = {
                    components = {
                        kind_icon = {
                            text = function(ctx)
                                local icon = ctx.kind_icon
                                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                                    if dev_icon then
                                        icon = dev_icon
                                    end
                                else
                                    icon = require("lspkind").symbolic(ctx.kind, {
                                        mode = "symbol",
                                    })
                                end

                                return icon .. ctx.icon_gap
                            end,

                            -- Optionally, use the highlight groups from nvim-web-devicons
                            -- You can also add the same function for `kind.highlight` if you want to
                            -- keep the highlight groups in sync with the icons.
                            highlight = function(ctx)
                                local hl = ctx.kind_hl
                                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                                    if dev_icon then
                                        hl = dev_hl
                                    end
                                end
                                return hl
                            end,
                        },
                    },
                },
            },
        },
    },
}
