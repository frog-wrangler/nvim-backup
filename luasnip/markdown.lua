local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

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
}
