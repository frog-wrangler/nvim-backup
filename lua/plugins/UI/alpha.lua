return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-lua/plenary.nvim",
    },
    opts = function()
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = require("data.banners")["random"]

        local main_buttons = {
            dashboard.button("o", "  > Open", ":lua Toggle_alpha_open_menu()<CR>"),
            dashboard.button("s", "  > Search keymaps", ":Telescope keymaps<CR>"),
            dashboard.button("l", "  > Lazy", ":Lazy<CR>"),
            dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
        }

        local open_buttons = {
            dashboard.button("o", "  > Open code", ":cd ~/sourceCode/ | :e .<CR>"),
            dashboard.button("q", "  > Open quickshell", ":cd ~/.config/quickshell/ | :e .<CR>"),
            dashboard.button("n", "  > Open notes", ":cd ~/notes/ | :e .<CR>"),
            dashboard.button("c", "  > Open config", ":cd " .. vim.fn.stdpath("config") .. " | :e .<CR>"),
            dashboard.button("e", "  > Exit", ":lua Toggle_alpha_open_menu()<CR>"),
        }

        local use_main = true

        function Toggle_alpha_open_menu()
            if use_main then
                dashboard.section.buttons.val = open_buttons
            else
                dashboard.section.buttons.val = main_buttons
            end
            use_main = not use_main
            vim.cmd("Alpha")
            vim.cmd("Alpha")
        end

        dashboard.section.buttons.val = main_buttons

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
