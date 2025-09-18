return {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
        disable_mouse = false,
        disabled_keys = {
            ["<Left>"] = false,
            ["<Right>"] = false,
            ["<Enter>"] = { "n", "x" },
        },
    },
}
