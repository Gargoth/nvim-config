lua << EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "python", "javascript", "json", "latex", "bash", "markdown", "html", "typescript" },
    highlight = {
        enable = true,
        disable = { "latex" },
        additional_vim_regex_highlighting = false,
    },
}
EOF

