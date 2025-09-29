return {
    "lewis6991/gitsigns.nvim",
    opts = {
        current_line_blame_opts = {
            delay = 500,
            ignore_whitespace = true,
        },
        signs = {
            delete    = { show_count = true },
            topdelete = { show_count = true },
        },
        signs_staged = {
            delete    = { show_count = true },
            topdelete = { show_count = true },
        },
    },
}
