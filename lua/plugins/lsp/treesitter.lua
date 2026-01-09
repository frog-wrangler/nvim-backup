return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "OXY2DEV/markview.nvim",
    },
    build = ":TSUpdate",
    config = function ()
        require("nvim-treesitter.install").prefer_git = true

        require("nvim-treesitter").setup({
            auto_install = true,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
