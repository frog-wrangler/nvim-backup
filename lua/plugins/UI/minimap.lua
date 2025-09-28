return {
    "Isrothy/neominimap.nvim",
    version = "v3.x.x",
    keys = {
        { "<leader>nm", "<cmd>Neominimap Toggle<cr>",      desc = "Toggle global minimap" },
        { "<leader>nr", "<cmd>Neominimap Refresh<cr>",     desc = "Refresh global minimap" },
        { "<leader>ns", "<cmd>Neominimap ToggleFocus<cr>", desc = "Switch focus on minimap" },
    },
    init = function()
        vim.opt.sidescrolloff = 36 -- Set a large value

        vim.g.neominimap = {
            auto_enable = true,
            float = {
                window_border = "double",
            },
            search = {
                enabled = true,
            },
        }
    end,
}
