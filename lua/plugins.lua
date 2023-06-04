-- Load lazy.nvim package manager
require("utils/lazybootstrap")
require("lazy").setup({

    "tpope/vim-commentary",

    {
        "lewis6991/gitsigns.nvim",
        opts = {},
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
        opts = {},
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
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
        opts = {
            defaults = { file_ignore_patterns = { "node_modules", "venv", "__pycache__" } },
        },
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "catppuccin/nvim",
        },
        opts = {
            theme = "catppuccin",
        },
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            {
                "williamboman/mason-lspconfig.nvim",
                opts = {},
                dependencies = { "williamboman/mason.nvim" },
            },
        },
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        opts = {},
    },

    {
        "williamboman/mason.nvim",
        opts = {},
        dependencies = {
            "mfussenegger/nvim-dap",
            "jose-elias-alvarez/null-ls.nvim",
        },
    },

    {
        "jay-babu/mason-null-ls.nvim",
        opts = {
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
        opts = {},
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
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

    {
        "ThePrimeagen/harpoon",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {},
    },

    {
        "glepnir/lspsaga.nvim",
        event = "LspAttach",
        config = function()
            require("lspsaga").setup({})
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {},
    },

    {
        "folke/trouble.nvim",
        opts = {},
    },

    {
        "SmiteshP/nvim-navbuddy",
        opts = { lsp = { auto_attach = true } },
        dependencies = {
            "neovim/nvim-lspconfig",
            "MunifTanjim/nui.nvim",
            "nvim-telescope/telescope.nvim",
            {
                "SmiteshP/nvim-navic",
                opts = { lsp = { auto_attach = true } },
                dependencies = { "neovim/nvim-lspconfig" },
            },
        },
    },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
    },
})
