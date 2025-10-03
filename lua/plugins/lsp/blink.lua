return {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "nvim-tree/nvim-web-devicons",
        "onsails/lspkind.nvim",

        {
            'Kaiser-Yang/blink-cmp-dictionary',
            dependencies = { 'nvim-lua/plenary.nvim' }
        },
        "MahanRahmati/blink-nerdfont.nvim",
        "disrupted/blink-cmp-conventional-commits",
        "erooke/blink-cmp-latex",
    },
    opts = {
        cmdline = {
            keymap = { preset = "inherit" },
            completion = { menu = { auto_show = true } },
        },
        keymap = {
            preset = "none",
            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },

            ["<C-Space>"] = { "select_and_accept" },
            ["<C-e>"] = { "cancel", "fallback" },

            ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
        },
        sources = {
            default = { "lsp", "buffer", "snippets", "path", "nerdfont" },
            per_filetype = {
                markdown = { "dictionary", "nerdfont", "latex", "snippets" },
                gitcommit = { "conventional_commits", "dictionary" },
            },
            providers = {
                dictionary = {
                    module = 'blink-cmp-dictionary',
                    name = 'Dict',
                    min_keyword_length = 3,
                    opts = {
                        dictionary_files = { vim.fn.expand("~/.config/nvim/lua/data/words_alpha.dict") }
                    },
                },
                nerdfont = {
                    module = "blink-nerdfont",
                    name = "Nerd Fonts",
                    score_offset = 15,
                    opts = { insert = true }, -- Insert nerdfont icon (default) or complete its name
                },
                conventional_commits = {
                    name = 'Conventional Commits',
                    module = 'blink-cmp-conventional-commits',
                },
                latex = {
                    name = "Latex",
                    module = "blink-cmp-latex",
                },
            },
        },
        completion = {
            list = {
                selection = {
                    preselect = false,
                    auto_insert = true,
                },
            },
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
