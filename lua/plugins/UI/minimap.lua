return {
    "Isrothy/neominimap.nvim",
    version = "v3.x.x",
    init = function ()
        vim.g.neominimap = {
            auto_enable = false,
            float = {
                window_border = "none",
            },

            exclude_filetypes = {
                "tex",
            },

            diagnostic = {
                mode = "icon",
            },
            git = {
                enabled = false,
            },
            fold = {
                enabled = false,
            },

            winopt = function (wo)
                wo.statuscolumn = ""
            end
        }

        require("neominimap.api").enable()
    end,
}
