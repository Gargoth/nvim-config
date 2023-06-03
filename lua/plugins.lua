-- Load lazy.nvim package manager
require("utils/lazybootstrap")
require("lazy").setup({

    "lewis6991/gitsigns.nvim",
    "folke/which-key.nvim",
    "lukas-reineke/indent-blankline.nvim",

    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = {
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
        }
    },

    {
        "nvim-treesitter/nvim-treesitter",
        config = {
            highlight = {
                enable = true,
            },
        }
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-lua/plenary.nvim",
        },
        config = {
            defaults = { file_ignore_patterns = {"node_modules", "venv", "__pycache__"} },
        }
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = {
            theme = "catppuccin"
        }
    }

})
