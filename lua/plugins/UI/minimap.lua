return {
    "Isrothy/neominimap.nvim",
    version = "v3.x.x",
    init = function()
        vim.opt.sidescrolloff = 20 -- Set a large value

        vim.g.neominimap = {
            auto_enable = true,
            search = {
                enabled = true,
            },
        }

        require("neominimap.api").enable()
    end,
}
