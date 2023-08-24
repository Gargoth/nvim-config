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

return {
    s(
        {
            -- Table 1: Snippet Parameters
            trig = "iferr",
            descr = "Autotriggering snippet for Go error handling",
            filetype = "go",
            snippetType = "autosnippet",
        },
        {
            -- Table 2: Snippet Nodes
            t({
                "if err != nil {",
                "   log.Panic(err)",
                "}",
                ""
            }),
        },
        {
            -- Table 3: Advanced Snippet Options
        }
    ),
}
