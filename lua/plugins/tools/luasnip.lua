return {
    "L3MON4D3/LuaSnip",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    build = "make install_jsregexp", -- optional
    init = function()
        local ls = require("luasnip")

        vim.keymap.set({ "i", "s" }, "<C-l>", function() ls.jump(1) end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-h>", function() ls.jump(-1) end, { silent = true })

        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/luasnip/" })
    end,
    opts = {
        enable_autosnippets = true,
        update_events = "TextChanged, TextChangedI",
    },
}
