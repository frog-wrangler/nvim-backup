return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
    },
    opts = {
        graph_style = "kitty",
        process_spinner = true,
        initial_branch_name = "main",
        kind = "floating",

        commit_editor = {
            kind = "tab",
            staged_diff_split_kind = "vsplit"
        },
    },
}
