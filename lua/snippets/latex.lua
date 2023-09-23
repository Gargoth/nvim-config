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
tex_utils.in_digraph = function() -- Graphviz digraph environment detection
    return tex_utils.in_env('digraph')
end

return {
    s(
        {
            -- Table 1: Snippet Parameters
            trig = "boiler",
            descr = "Initialize LaTeX document with boilerplate",
            filetype = "tex",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \documentclass[10pt]{article}

                \usepackage[english]{babel}
                \usepackage[margin=0.7in]{geometry}
                \usepackage{amssymb, textcomp, gensymb, mathrsfs, amsmath, mathtools, float, listings, lipsum, xcolor, pgfplots, hyperref, etoolbox, multicol, soul}

                \usepackage{graphicx}
                \graphicspath{ {./images/} }
                \usepackage[pdf]{graphviz}
                \pgfplotsset{width=10cm,compat=1.9}

                % Makes ceil{x} and floor{x} syntax possible
                \DeclarePairedDelimiter{\ceil}{\lceil}{\rceil}
                \DeclarePairedDelimiter{\floor}{\lfloor}{\rfloor}

                % Change font to Sans Serif
                \renewcommand{\familydefault}{\sfdefault}

                \hyphenpenalty=10000 % Prevent hyphenating words on line end

                % Colorscheme
                <>

                % Codeblock styling
                \lstdefinestyle{codeblock}{
                    backgroundcolor=\color{Surface},   
                    commentstyle=\color{Subtext},
                    keywordstyle=\color{Mauve},
                    numberstyle=\tiny\color{Subtext},
                    stringstyle=\color{Green},
                    basicstyle=\ttfamily\footnotesize,
                    breakatwhitespace=false,         
                    breaklines=true,                 
                    captionpos=b,                    
                    keepspaces=true,                 
                    numbers=left,                    
                    numbersep=5pt,                  
                    showspaces=false,                
                    showstringspaces=false,
                    showtabs=false,                  
                    tabsize=2
                }
                \lstset{style=codeblock}

                % Patch headings and page style text color
                \makeatletter
                % patch the "plain" page style
                \patchcmd{\ps@plain}{\thepage}{\textcolor{Text}{\thepage}}{}{}
                % patch the "headings" page style
                \if@twoside
                    \patchcmd{\ps@headings}{\thepage\hfil}{\textcolor{Text}{\thepage}\hfil}{}{}
                    \patchcmd{\ps@headings}{\hfil\thepage}{\hfil\textcolor{Text}{\thepage}}{}{}
                \else
                    \patchcmd{\ps@headings}{\hfil\thepage}{\hfil\textcolor{Text}{\thepage}}{}{}
                \fi
                % patch the "myheadings" page style
                \patchcmd{\ps@myheadings}{\thepage\hfil}{\textcolor{Text}{\thepage}\hfil}{}{}
                \patchcmd{\ps@myheadings}{\hfil\thepage}{\hfil\textcolor{Text}{\thepage}}{}{}
                \makeatother

                % Hyperref setup
                \hypersetup{
                    colorlinks=true,
                    linktoc=all,
                    linkcolor=Lavender,
                    urlcolor=Blue,
                }

                \setlength{\parindent}{0pt}

                \title{<>}
                \author{Christian Jay F. Rosales}

                % ===== START OF DOCUMENT =====
                \begin{document}

                \pagecolor{Base}
                \color{Text}

                \maketitle

                \tableofcontents

                \pagebreak

                \section{Introduction}

                \lipsum

                \end{document}
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
            trig = "a\\",
            descr = "Insert alpha symbol",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \alpha
            ]],
            {}
        ),
        {
            -- Table 3: Advanced Snippet Options
            condition = tex_utils.in_mathzone
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "b\\",
            descr = "Insert beta symbol",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \beta
            ]],
            {}
        ),
        {
            -- Table 3: Advanced Snippet Options
            condition = tex_utils.in_mathzone
        }
    ),


    s(
        {
            -- Table 1: Snippet Parameters
            trig = "ff\\",
            descr = "Add fraction",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \frac{<>}{<>}
            ]],
            { i(1), i(2) }
        ),
        {
            -- Table 3: Advanced Snippet Options
            condition = tex_utils.in_mathzone
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "intfty",
            descr = "Add integral from negative infinity to positive infinity",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \int^{\infty}_{\infty}
            ]],
            {}
        ),
        {
            -- Table 3: Advanced Snippet Options
            condition = tex_utils.in_mathzone
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "\\nn",
            descr = "Expand to no number",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \nonumber \\
            ]],
            {}
        ),
        {
            -- Table 3: Advanced Snippet Options
            condition = tex_utils.in_mathzone
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "sum\\",
            descr = "Add summation",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \sum^{<>}_{<>}
            ]],
            { i(1), i(2) }
        ),
        {
            -- Table 3: Advanced Snippet Options
            condition = tex_utils.in_mathzone
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "int\\",
            descr = "Add definite integral",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \int^{<>}_{<>}
            ]],
            { i(1), i(2) }
        ),
        {
            -- Table 3: Advanced Snippet Options
            condition = tex_utils.in_mathzone
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "diff\\",
            descr = "Add differential equation",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \frac{d^{<>} <>}{d <>^{<>}}
            ]],
            { i(1), i(2), i(3), rep(1) }
        ),
        {
            -- Table 3: Advanced Snippet Options
            condition = tex_utils.in_mathzone
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "pdiff\\",
            descr = "Add partial differential equation",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \frac{\partial^{<>} <>}{\partial <>^{<>}}
            ]],
            { i(1), i(2), i(3), rep(1) }
        ),
        {
            -- Table 3: Advanced Snippet Options
            condition = tex_utils.in_mathzone
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "=\\",
            descr = "Add an equation in math mode",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                <> &= <>
            ]],
            { i(1), i(2) }
        ),
        {
            -- Table 3: Advanced Snippet Options
            condition = tex_utils.in_mathzone
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "2=\\",
            descr = "Add an equation with two equalities in math mode",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                <> &= <> &= <>
            ]],
            { i(1), i(2), i(3) }
        ),
        {
            -- Table 3: Advanced Snippet Options
            condition = tex_utils.in_mathzone
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "box\\",
            descr = "Add boxed element",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \boxed{<>}
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
            trig = "it\\",
            descr = "Italic text",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \textit{<>}
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
            trig = "bl\\",
            descr = "Bold text",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \textbf{<>}
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
            trig = "catmacchiato",
            descr = "Define Catppuccin Macchiato Colors",
            filetype = "tex",
            snippetType = "snippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                % Catppuccin Macchiato Colors
                \definecolor{Rosewater}{HTML}{f4dbd6}
                \definecolor{Flamingo}{HTML}{f0c6c6}
                \definecolor{Pink}{HTML}{f5bde6}
                \definecolor{Mauve}{HTML}{c6a0f6}
                \definecolor{Red}{HTML}{ed8796}
                \definecolor{Maroon}{HTML}{ee99a0}
                \definecolor{Peach}{HTML}{f5a97f}
                \definecolor{Yellow}{HTML}{eed49f}
                \definecolor{Green}{HTML}{a6da95}
                \definecolor{Teal}{HTML}{8bd5ca}
                \definecolor{Sky}{HTML}{91d7e3}
                \definecolor{Sapphire}{HTML}{7dc4e4}
                \definecolor{Blue}{HTML}{8aadf4}
                \definecolor{Lavender}{HTML}{b7bdf8}
                \definecolor{Text}{HTML}{cad3f5}
                \definecolor{Subtext}{HTML}{a5adcb}
                \definecolor{Surface}{HTML}{363a4f}
                \definecolor{Base}{HTML}{24273a}
                \definecolor{Mantle}{HTML}{1e2030}
                \definecolor{Crust}{HTML}{181926}
            ]],
            {}
        ),
        {
            -- Table 3: Advanced Snippet Options
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "catlatte",
            descr = "Define Catppuccin Latte Colors",
            filetype = "tex",
            snippetType = "snippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                % Catppuccin Latte Colors
                \definecolor{Rosewater}{HTML}{dc8a78}
                \definecolor{Flamingo}{HTML}{dd7878}
                \definecolor{Pink}{HTML}{ea76cb}
                \definecolor{Mauve}{HTML}{8839ef}
                \definecolor{Red}{HTML}{d20f39}
                \definecolor{Maroon}{HTML}{e64553}
                \definecolor{Peach}{HTML}{fe640b}
                \definecolor{Yellow}{HTML}{df8e1d}
                \definecolor{Green}{HTML}{40a02b}
                \definecolor{Teal}{HTML}{179299}
                \definecolor{Sky}{HTML}{04a5e5}
                \definecolor{Sapphire}{HTML}{209fb5}
                \definecolor{Blue}{HTML}{1e66f5}
                \definecolor{Lavender}{HTML}{7287fd}
                \definecolor{Text}{HTML}{000000}
                \definecolor{Subtext}{HTML}{4c4f69}
                \definecolor{Surface}{HTML}{ccd0da}
                \definecolor{Base}{HTML}{ffffff}
                \definecolor{Mantle}{HTML}{eff1f5}
                \definecolor{Crust}{HTML}{e6e9ef}
            ]],
            {}
        ),
        {
            -- Table 3: Advanced Snippet Options
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "catmocha",
            descr = "Define Catppuccin Mocha colors",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                % Catppuccin Mocha Colors
                \definecolor{Rosewater}{HTML}{f5e0dc}
                \definecolor{Flamingo}{HTML}{f2cdcd}
                \definecolor{Pink}{HTML}{f5c2e7}
                \definecolor{Mauve}{HTML}{cba6f7}
                \definecolor{Red}{HTML}{f38ba8}
                \definecolor{Maroon}{HTML}{eba0ac}
                \definecolor{Peach}{HTML}{fab387}
                \definecolor{Yellow}{HTML}{f9e2af}
                \definecolor{Green}{HTML}{a6e3a1}
                \definecolor{Teal}{HTML}{94e2d5}
                \definecolor{Sky}{HTML}{89dceb}
                \definecolor{Sapphire}{HTML}{74c7ec}
                \definecolor{Blue}{HTML}{89b4fa}
                \definecolor{Lavender}{HTML}{b4befe}
                \definecolor{Text}{HTML}{cdd6f4}
                \definecolor{Subtext}{HTML}{bac2de}
                \definecolor{Surface}{HTML}{313244}
                \definecolor{Base}{HTML}{1e1e2e}
                \definecolor{Mantle}{HTML}{181825}
                \definecolor{Crust}{HTML}{11111b}
            ]],
            {}
        ),
        {
            -- Table 3: Advanced Snippet Options
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "cbox\\",
            descr = "Add colored box",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \colorbox{<>}{<>}
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
            trig = "d\\",
            descr = "Add delta character",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \delta
            ]],
            {}
        ),
        {
            -- Table 3: Advanced Snippet Options
            condition = tex_utils.in_mathzone
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "^",
            descr = "Automatically add curly brace to superscript",
            filetype = "tex",
            wordTrig = false,
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                ^{<>}
            ]],
            { i(1) }
        ),
        {
            -- Table 3: Advanced Snippet Options
            condition = tex_utils.in_mathzone
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "_",
            descr = "Automatically add curly brace to subscript",
            filetype = "tex",
            wordTrig = false,
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                _{<>}
            ]],
            { i(1) }
        ),
        {
            -- Table 3: Advanced Snippet Options
            condition = tex_utils.in_mathzone
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "h\\",
            descr = "Add hat",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \hat{<>}
            ]],
            { i(1) }
        ),
        {
            -- Table 3: Advanced Snippet Options
            condition = tex_utils.in_mathzone
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "ov\\",
            descr = "Add overline",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \overline{<>}
            ]],
            { i(1) }
        ),
        {
            -- Table 3: Advanced Snippet Options
            condition = tex_utils.in_mathzone
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "v\\",
            descr = "Add vector (right overline)",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \vec{<>}
            ]],
            { i(1) }
        ),
        {
            -- Table 3: Advanced Snippet Options
            condition = tex_utils.in_mathzone
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "pl\\",
            descr = "Add plot in pgfplots axis",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \addplot[color=<>]{
                    <>
                };
            ]],
            { i(1), i(2) }
        ),
        {
            -- Table 3: Advanced Snippet Options
            condition = tex_utils.in_axis
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "pl3\\",
            descr = "Add 3d plot in pgfplots axis",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \addplot3[surf]{ % Can replace surf with mesh
                    <>
                };
            ]],
            { i(1) }
        ),
        {
            -- Table 3: Advanced Snippet Options
            condition = tex_utils.in_axis
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "plc\\",
            descr = "Add coordinates plot in pgf axis",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \addplot[color=<>, mark=<>] coordinates {
                    <>
                };
            ]],
            { i(1), i(2), i(3) }
        ),
        {
            -- Table 3: Advanced Snippet Options
            condition = tex_utils.in_axis
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "le\\",
            descr = "Add legend in Tikz environment",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \addlegendentry{\(<>\)}
            ]],
            { i(1) }
        ),
        {
            -- Table 3: Advanced Snippet Options
            condition = tex_utils.in_axis
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "ref\\",
            descr = "Add reference to label",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \ref{<>}
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
            trig = "href\\",
            descr = "Add hyperlink reference",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \href{<>}{<>}
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
            trig = "importlisting",
            descr = "Add new listing (codeblock) from file",
            filetype = "tex",
            snippetType = "snippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \lstinputlisting{<>}[language=<>]
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
            trig = "expr\\",
            descr = "Evaluate expression",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \pgfmathparse{<>}\pgfmathresult
            ]],
            { i(1, "expr") }
        ),
        {
            -- Table 3: Advanced Snippet Options
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "var\\",
            descr = "Define new variable",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \def\<>{<>}
            ]],
            { i(1, "varname"), i(2, "value") }
        ),
        {
            -- Table 3: Advanced Snippet Options
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "ul\\",
            descr = "Add underlined text",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \ul{<>}
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
            trig = "txt\\",
            descr = "Add text",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \text{<>}
            ]],
            { i(1) }
        ),
        {
            -- Table 3: Advanced Snippet Options
            tex_utils.in_mathzone
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "fig\\",
            descr = "Insert figure with image and caption",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \begin{figure}[h]
                    \centering
                    \includegraphics[width=<>\textwidth]{<>}
                    \caption{<>}
                    \label{fig:<>}
                \end{figure}
            ]],
            { i(1, "Image width"), i(2, "Filename without extension"), i(3, "Caption"), i(4, "Label") }
        ),
        {
            -- Table 3: Advanced Snippet Options
            
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "href\\",
            descr = "Add hyperref to label",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \hyperref[<>]{<>}
            ]],
            { i(1, label), i(2, text) }
        ),
        {
            -- Table 3: Advanced Snippet Options
            
        }
    ),

    s(
        {
            -- Table 1: Snippet Parameters
            trig = "inlist\\",
            descr = "Add inline listing",
            filetype = "tex",
            snippetType = "autosnippet",
        },

        -- Table 2: Snippet Nodes
        fmta(
            [[
                \lstinline[language=<>]{<>}
            ]],
            { i(1), i(2) }
        ),
        {
            -- Table 3: Advanced Snippet Options
            
        }
    ),
}
