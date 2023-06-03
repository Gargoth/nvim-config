-- Load lazy.nvim package manager
require("utils/lazybootstrap")
require("lazy").setup({

    {
        "lewis6991/gitsigns.nvim",
        config = {},
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            registers = false,
        },
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        config = {},
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
        },
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-lua/plenary.nvim",
        },
        config = {
            defaults = { file_ignore_patterns = { "node_modules", "venv", "__pycache__" } },
        },
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "catppuccin/nvim",
        },
        config = {
            theme = "catppuccin",
        },
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
        "jose-elias-alvarez/null-ls.nvim",
        config = {},
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
            handlers = {},
        },
        dependencies = {
            "williamboman/mason.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
    },

    {
        "jay-babu/mason-nvim-dap.nvim",
        config = {},
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
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
        },
    },
})
