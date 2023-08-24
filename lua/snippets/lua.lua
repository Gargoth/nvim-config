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
            trig = "sboiler",
            descr = "Boilerplate for new luasnip file",
            filetype = "lua",
            snippetType = "autosnippet",
        },
        -- Table 2: Snippet Nodes
        fmta(
            [[
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
                    <>
                }
            ]],
            { i(1) }
        )
        ,
        {
            -- Table 3: Advanced Snippet Options
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "snip",
            descr = "Adds new snippet",
            filetype = "lua",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [=[
            s(
                {
                    -- Table 1: Snippet Parameters
                    trig = "<>",
                    descr = "<>",
                    filetype = "<>",
                    snippetType = "autosnippet",
                },

                -- Table 2: Snippet Nodes
                fmta(
                    [[
                        <>
                    ]],
                    { <> }
                ),
                {
                    -- Table 3: Advanced Snippet Options
                    <>
                }
            ),
            ]=],
            { i(1), i(2), i(3), i(4), i(5), i(6) }
        ),
        {
            -- Table 3: Advanced Snippet Options
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "map",
            descr = "Add new mapping",
            filetype = "lua",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                map("<>", "<>", "<>", { desc = "<>" })
            ]],
            { i(1), i(2), i(3), i(4) }
        ),
        {
            -- Table 3: Advanced Snippet Options
        }
    ),
}
