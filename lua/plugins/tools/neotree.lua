return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    opts = {
        sources = {
            "filesystem",
            "buffers",
            "document_symbols",
        },
        filesystem = {
            filtered_items = {
                visible = true,
            },
        },
        document_symbols = {
            follow_cursor = true,
            follow_tree_cursor = true,
        },
        default_component_configs = {
            git_status = {
                symbols = {
                    -- Change type
                    added = "✚",
                    modified = "",
                    deleted = "✖", -- this can only be used in the git_status source
                    renamed = "󰑕", -- this can only be used in the git_status source
                    -- Status type
                    untracked = "",
                    ignored = "",
                    unstaged = "󰄱",
                    staged = "",
                    conflict = "",
                },
            },
        },
    },
}
