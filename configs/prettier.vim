lua << EOF
require("prettier").setup({
    cli_options = {
        bracket_spacing = true,
        bracket_same_line = true,
        tab_width = 4,
        use_tabs = false,
    },
})
EOF

