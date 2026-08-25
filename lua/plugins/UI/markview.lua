return {
    "OXY2DEV/markview.nvim",
    dependencies = {
        "catppuccin/nvim",
        "saghen/blink.cmp",
    },
    config = function()
        local presets = require("markview.presets")

        require("markview").setup({
            html = {
                enable = true,
                container_elements = { enable = true },
            },
            latex = {
                enable = true,
                blocks = { enable = true },
                inlines = { enable = true },
            },
            markdown = {
                enable = true,
                headings = presets.headings.arrowed,
                horizontal_rules = presets.horizontal_rules.dashed,
                tables = presets.tables.double
            },
            markdown_inline = {
                enable = true,
                tags = {
                    enable = true,
                    default = {
                        hl = "MarkviewCodeInfo",
                        padding_left = "",
                        padding_left_hl = "MarkviewCodeFg",
                        padding_right = "",
                        padding_right_hl = "MarkviewCodeFg"
                    },
                },
            },
            preview = {
                modes = { "i", "n", "no", "c" },
                hybrid_modes = { "i", "n" },
                linewise_hybrid_mode = true,
            },
        });
    end
}
