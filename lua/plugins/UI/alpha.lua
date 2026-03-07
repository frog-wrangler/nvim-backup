return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-lua/plenary.nvim",
    },
    opts = function()
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = require("data.banners")["random"]

        dashboard.section.buttons.val = {
            dashboard.button("o", "  > Open code", ":cd ~/sourceCode/ | :e .<CR>"),
            dashboard.button("c", "  > Open config", ":cd " .. vim.fn.stdpath("config") .. " | :e .<CR>"),
            dashboard.button("q", "  > Open quickshell", ":cd ~/.config/quickshell/ | :e .<CR>"),
            dashboard.button("n", "  > Open notes", ":cd ~/notes/ | :e .<CR>"),
            dashboard.button("l", "  > Lazy", ":Lazy<CR>"),
            dashboard.button("e", "  > Exit NVIM", ":qa<CR>"),
        }

        local quote = require("data.quotes")
        dashboard.section.footer.val = quote()

        -- color all sections
        vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#F8A1E7" })
        vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#DB65AA" })
        vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#85C16A" })

        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = "AlphaButtons"
            button.opts.hl_shortcut = "AlphaShortcut"
        end
        dashboard.section.header.opts.hl = "AlphaHeader"
        dashboard.section.buttons.opts.hl = "AlphaButtons"

        -- for performance; may break autocmds
        dashboard.config.opts.noautocmd = false

        return dashboard.opts
    end,
};
