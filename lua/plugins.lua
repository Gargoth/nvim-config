-- Load lazy.nvim package manager
require("utils/lazybootstrap")
require("lazy").setup({

    {
        "lewis6991/gitsigns.nvim",
        config = {},
    },

    {
        "folke/which-key.nvim",
        config = {}
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        config = {},
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
        config = {},
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
            "catppuccin/nvim",
        },
        config = {
            theme = "catppuccin"
        }
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            {
                "williamboman/mason-lspconfig.nvim",
                config = {},
                dependencies = { "williamboman/mason.nvim" },
            },
        },
    },

    {
        "williamboman/mason.nvim",
        config = {},
        dependencies = {
            "mfussenegger/nvim-dap",
            "jose-elias-alvarez/null-ls.nvim",
        },
    },

    {
        "jay-babu/mason-null-ls.nvim",
        config = {
            automatic_setup = true,
        },
        dependencies = {
            "williamboman/mason.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        }
    },

    {
        "jay-babu/mason-nvim-dap.nvim",
        config = {},
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        }
    },

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
})

require("mason-lspconfig").setup_handlers {
    function (server_name)
        require("lspconfig")[server_name].setup {}
    end,
}
