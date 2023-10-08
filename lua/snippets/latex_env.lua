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

-- Some LaTeX-specific conditional expansion functions (requires VimTeX)

local tex_utils = {}
tex_utils.in_mathzone = function() -- math context detection
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
tex_utils.in_text = function()
    return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function() -- comment detection
    return vim.fn['vimtex#syntax#in_comment']() == 1
end
tex_utils.in_env = function(name) -- generic environment detection
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex_utils.in_tikz = function() -- TikZ picture environment detection
    return tex_utils.in_env('tikzpicture')
end
tex_utils.in_axis = function() -- pgfplots axis environment detection
    return tex_utils.in_env('axis')
end
tex_utils.in_graph = function() -- Graphviz graph environment detection
    return tex_utils.in_env('graph')
end
tex_utils.in_digraph = function() -- Graphviz digraph environment detection
    return tex_utils.in_env('digraph')
end

return {
    s(
        {
            -- Table 1: Snippet Parameters
            trig = "env",
            descr = "Add new LaTeX environment",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
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
        ),
        {
            -- Table 3: Advanced Snippet Options
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "eq\\",
            descr = "Begin equation environment",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \begin{equation}
                    \label{<>}
                    <>
                \end{equation}
            ]],
            { i(1), i(2) }
        ),
        {
            -- Table 3: Advanced Snippet Options
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "m\\",
            descr = "Add inline equation",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                $<>$
            ]],
            { i(1) }
        ),
        {
            -- Table 3: Advanced Snippet Options
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "mm\\",
            descr = "Create unlabeled equation",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \[
                    <>
                \]
            ]],
            { i(1) }
        ),
        {
            -- Table 3: Advanced Snippet Options
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "ce\\",
            descr = "Create centered environment",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \begin{center}
                    <>
                \end{center}
            ]],
            { i(1) }
        ),
        {
            -- Table 3: Advanced Snippet Options
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "al\\",
            descr = "Begin align environment",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \begin{align}
                    <>
                \end{align}
            ]],
            { i(1) }
        ),
        {
            -- Table 3: Advanced Snippet Options
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "sp\\",
            descr = "Begin split environment",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \begin{split}
                    <>
                \end{split}
            ]],
            { i(1) }
        ),
        {
            -- Table 3: Advanced Snippet Options
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "sec\\",
            descr = "Add new section",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \section{<>}
            ]],
            { i(1) }
        ),
        {
            -- Table 3: Advanced Snippet Options
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "ssec\\",
            descr = "Add a new subsection",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \subsection{<>}
            ]],
            { i(1) }
        ),
        {
            -- Table 3: Advanced Snippet Options
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "sssec\\",
            descr = "Add a new subsubsection",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \subsubsection{<>}
            ]],
            { i(1) }
        ),
        {
            -- Table 3: Advanced Snippet Options
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "tikz\\",
            descr = "Add new Tikz environment",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \begin{tikzpicture}
                    <>
                \end{tikzpicture}
            ]],
            { i(1) }
        ),
        {
            -- Table 3: Advanced Snippet Options
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "ax3\\",
            descr = "Add new axis with defaults for 3d plot in Tikz environment",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \begin{axis}[
                    title={<>},
                    legend style={fill=Surface,draw=Text}, % Remove if not using colorscheme
                    hide axis,
                    colormap/violet,
                ]
                    <>
                \end{axis}
            ]],
            { i(1), i(2) }
        ),
        {
            -- Table 3: Advanced Snippet Options
            condition = tex_utils.in_tikz
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "ax\\",
            descr = "Add new axis in Tikz environment",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \begin{axis}[
                    title={<>},
                    xlabel={<>},
                    ylabel={<>},
                    xmajorgrids=true,
                    ymajorgrids=true,
                    grid style=dashed,
                    legend style={fill=Surface,draw=Text}, % Remove if not using colorscheme
                    legend pos=north west,
                    xtick={},
                    ytick={},
                ]
                    <>
                \end{axis}
            ]],
            { i(1), i(2), i(3), i(4) }
        ),
        {
            -- Table 3: Advanced Snippet Options
            condition = tex_utils.in_tikz
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "listing\\",
            descr = "Add new listing (codeblock)",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \begin{lstlisting}[language=<>]
                    <>
                \end{lstlisting}
            ]],
            { i(1), i(2) }
        ),
        {
            -- Table 3: Advanced Snippet Options
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "cols\\",
            descr = "Add multiple column environment",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \begin{multicols}{<>}
                \end{multicols}
            ]],
            { i(1) }
        ),
        {
            -- Table 3: Advanced Snippet Options
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "cb\\",
            descr = "Add codeblock with minted",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \begin{minted}{<>}
                    <>
                \end{minted}
            ]],
            { i(1, "Language"), i(2) }
        ),
        {
            -- Table 3: Advanced Snippet Options
            
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "labitem\\",
            descr = "Add section and subsections for answering a Laboratory item",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \section{Item <>}

                \subsection{Instruction / Problem}

                \subsection{Answer}

            ]],
            { i(1) }
        ),
        {
            -- Table 3: Advanced Snippet Options
            
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "dot\\",
            descr = "Add graphviz digraph",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \digraph{<>}{
                    <>
                }
            ]],
            { i(1, name), i(2) }
        ),
        {
            -- Table 3: Advanced Snippet Options
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "dot\\",
            descr = "Add graphviz digraph",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \digraph{<>}{
                    <>
                }
            ]],
            { i(1, name), i(2) }
        ),
        {
            -- Table 3: Advanced Snippet Options
        }
    ),
}
