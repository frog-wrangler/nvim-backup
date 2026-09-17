local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
    s(
        {
            trig = "uu;",
            dscr = "Inserts mardown underline tags",
            snippetType = "autosnippet",
        },
        {
            t("<u>"),
            i(1),
            t("</u>"),
            i(0),
        }
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

                return varName .. "_{" .. num .. "}"
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

    s(
        {
            trig = "defn;",
            dscr = "Inserts definition for graph theory",
            snippetType = "autosnippet",
        },
        {
            t("**Definition:** "),
            i(0),
        }
    ),

    s(
        {
            trig = "proof;",
            dscr = "Inserts proof for graph theory",
            snippetType = "autosnippet",
        },
        {
            t("**Proof:** "),
            i(0),
        }
    ),

    s(
        {
            trig = "thm;",
            dscr = "Inserts theorem for graph theory",
            snippetType = "autosnippet",
        },
        {
            t("**Theorem "),
            i(1),
            t(":** "),
            i(0),
        }
    ),
}
