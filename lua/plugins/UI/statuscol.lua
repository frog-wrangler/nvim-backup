return {
    "luukvbaal/statuscol.nvim",
    config = function()
        local builtin = require("statuscol.builtin")
        require("statuscol").setup({
            relculright = true,
            ft_ignore = nil,
            bt_ignore = { "nofile", "terminal", "help" },
            segments = {
                {
                    text = { " " },
                    click = "v:lua.ScLa",
                },
                {
                    sign = {
                        name = { "DapBreakpoint" },
                        maxwidth = 1,
                        colwidth = 1,
                    },
                    click = "v:lua.ScLa",
                },
                {
                    text = {
                        function(args)
                            return ((args.relnum == 0) and "%#Statement#" or "")
                        end,
                        builtin.lnumfunc,
                        " ",
                    },
                    click = "v:lua.ScLa",
                },
                {
                    sign = {
                        namespace = { "gitsigns" },
                        maxwidth = 1,
                        colwidth = 1,
                        auto = " %#Statement#┆ ",
                    },
                    text = { function(args)
                        if args.empty then
                            return " %#Statement#┆ "
                        end
                        return ""
                    end },
                    click = "v:lua.ScSa",
                },
                {
                    text = { " " },
                }
            },
        })
    end,
}
