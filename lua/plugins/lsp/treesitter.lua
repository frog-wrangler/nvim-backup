return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "OXY2DEV/markview.nvim" },
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.install").prefer_git = false

        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "lua", "c", "vimdoc", "qmljs", "python", "markdown", "markdown_inline", "r", "rnoweb" },
            modules = {},
            ignore_install = {},
            auto_install = true,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
