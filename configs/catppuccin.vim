lua << EOF
require("catppuccin").setup({
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    background = {
        light = "latte",
        dark = "macchiato",
    },
    transparent_background = true,
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    integrations = {
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
    },
})
EOF

colorscheme catppuccin
