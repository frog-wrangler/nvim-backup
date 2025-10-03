return {
    {
        "feakuru/mypy.nvim",
        opts = {
            extra_args = {
                "--check-untyped-defs",
                "--ignore-missing-imports",
                "--implicit-optional",
                "--verbose",
            },
        },
    },
    {
        "jjvanvuren/isort.nvim",
        opts = {
            keymap = "<leader>si",
        },
    },
}
