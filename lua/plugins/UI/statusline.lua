return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "arkav/lualine-lsp-progress",
        "folke/noice.nvim",
    },
    opts = {
        options = {
            icons_enabled = true,
            theme = "palenight",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            globalstatus = true,
        },
        sections = {
            lualine_a = { {
                require("noice").api.statusline.mode.get,
                cond = require("noice").api.statusline.mode.has,
            }, },
            lualine_b = { "branch", "diagnostics" },
            lualine_c = { "filename", {
                "lsp_progress",
                display_components = { "lsp_client_name", { "title", "percentage" } },
                separators = {
                    component = " | ",
                    progress = " * ",
                    percentage = { pre = "", post = "%% " },
                    title = { pre = "", post = ": " },
                    lsp_client_name = { pre = "[", post = "]" },
                }
            } },
            lualine_x = { {
                require("noice").api.statusline.mode.get,
                cond = require("noice").api.statusline.mode.has,
            }, "filetype" },
            lualine_y = { "fileformat" },
            lualine_z = { "progress", "location" },
        },
    },
}
