return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "OXY2DEV/markview.nvim",
        "nvim-treesitter/nvim-treesitter-context",
    },
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.install").prefer_git = true

        require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua", "c", "vimdoc", "qmljs", "python", "markdown", "markdown_inline" },
            modules = {},
            ignore_install = {},
            auto_install = true,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
