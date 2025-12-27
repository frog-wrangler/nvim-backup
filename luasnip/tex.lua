local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
    s(
        {
            trig = "root",
            dscr = "Inserts the TEX root as the current buffer",
            snippetType = "autosnippet",
            condition = line_begin,
        },
        {
            t("%! TEX root = "),
        }
    ),

    s(
        {
            trig = "ff;",
            dscr = "Fraction command",
            snippetType = "autosnippet",
        },
        fmta(
            "\\frac{<>}{<>}<>",
            {
                i(1),
                i(2),
                i(0),
            }
        )
    ),

    s(
        {
            trig = "enum",
            dscr = "Enumeration block with label from enumitem",
            snippetType = "autosnippet",
            condition = line_begin,
        },
        fmta(
            [[
            \begin{enumerate}[label=<>]
                \item <>
            \end{enumerate}
            ]],
            {
                i(1),
                i(2),
            }
        )
    ),

    s(
        {
            trig = "ff",
            dscr = "Add fraction",
        },
        fmta(
            "\\frac{<>}{<>}<>",
            {
                i(1),
                i(2),
                i(0),
            }
        )
    ),

    s(
        {
            trig = "vs",
            dscr = "Vertical space command",
            snippetType = "autosnippet",
            condition = line_begin,
        },
        fmta(
            [[
            \vspace{<>}<>
            ]],
            {
                i(1, "1em"),
                i(0),
            }
        )
    ),

    s(
        {
            trig = "pp",
            dscr = "Add usepackage command",
            snippetType = "autosnippet",
            condition = line_begin,
        },
        fmta(
            [[
            \usepackage{<>}<>
            ]],
            {
                i(1),
                i(0),
            }
        )
    ),

    s(
        {
            trig = "env",
            dscr = "Insert new environment",
            snippetType = "autosnippet",
            condition = line_begin,
        },
        fmta(
            [[
            \begin{<>}
                <>
            \end{<>}
            ]],
            {
                i(1),
                i(2),
                rep(1),
            }
        )
    ),

    s(
        {
            trig = "(%a)([%d]+);",
            dscr = "Add subscript to var",
            regTrig = true,
            wordTrig = false,
            snippetType = "autosnippet",
        },
        {
            f(function(_, snip)
                local varName = snip.captures[1]
                local num = snip.captures[2]

                print(varName .. num)

                if string.len(num) > 1 then
                    return varName .. "_{" .. num .. "}"
                end
                return varName .. "_" .. num
            end)
        }
    ),

    s(
        {
            trig = "ss;",
            dscr = "Add superscript",
            snippetType = "autosnippet",
        },
        {
            t("^{"),
            i(1),
            t("}"),
        }
    ),
}
