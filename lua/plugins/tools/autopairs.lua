return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
        disable_in_visualblock = true,
    },
    init = function()
        local Rule = require('nvim-autopairs.rule')
        local npairs = require('nvim-autopairs')
        local cond = require('nvim-autopairs.conds')

        npairs.add_rules({
            Rule("$", "$", { "tex", "markdown" })
                :with_pair(cond.done())
                :with_move(function(opts)
                    return opts.line:sub(opts.col - 1, opts.col - 1) ~= "$"
                end),

            Rule("\\[", "\\]", { "tex", "markdown" })
                :with_pair(cond.done())
                :with_cr(cond.done()),
        })
    end
}
