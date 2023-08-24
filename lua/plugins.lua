-- Load lazy.nvim package manager
require("utils/lazybootstrap")
require("lazy").setup({
    spec = {

        {
            "tpope/vim-commentary",
            event = "VeryLazy",
        },

        {
            "lewis6991/gitsigns.nvim",
            event = { "BufReadPre", "BufNewFile" },
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
            event = { "BufReadPre", "BufNewFile" },
            opts = {},
        },

        {
            "folke/todo-comments.nvim",
            event = "VeryLazy",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-telescope/telescope.nvim",
            },
            opts = {},
        },

        {
            "nvim-neo-tree/neo-tree.nvim",
            cmd = { "Neotree", "Neotree toggle" },
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons",
                "MunifTanjim/nui.nvim",
            },
        },

        {
            "nvim-telescope/telescope.nvim",
            cmd = "Telescope",
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
            event = { "BufReadPre", "BufNewFile" },
            dependencies = {
                "williamboman/mason.nvim",
                {
                    "williamboman/mason-lspconfig.nvim",
                    opts = {},
                    dependencies = { "williamboman/mason.nvim" },
                },
                {
                    "SmiteshP/nvim-navbuddy",
                    opts = { lsp = { auto_attach = true } },
                    dependencies = {
                        "MunifTanjim/nui.nvim",
                        "nvim-telescope/telescope.nvim",
                        {
                            "SmiteshP/nvim-navic",
                            opts = { lsp = { auto_attach = true } },
                        },
                    },
                },
            },
        },

        {
            "hrsh7th/nvim-cmp",
            event = "InsertEnter",
            dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lsp-signature-help",
            },
            opts = function()
                local cmp = require("cmp")
                cmp.setup({
                    snippet = {
                        expand = function(args)
                            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                        end,
                    },
                    window = {
                        completion = cmp.config.window.bordered(),
                        documentation = cmp.config.window.bordered(),
                    },
                    mapping = cmp.mapping.preset.insert({
                        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                        ["<C-f>"] = cmp.mapping.scroll_docs(4),
                        ["<C-Space>"] = cmp.mapping.complete(),
                        ["<C-e>"] = cmp.mapping.abort(),
                        ["<tab>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    }),
                    sources = cmp.config.sources({
                        { name = "nvim_lsp" },
                        { name = "luasnip" }, -- For luasnip users.
                        { name = 'nvim_lsp_signature_help' }
                    }, {
                        { name = "buffer" },
                    }),
                })
            end
        },

        {
            "williamboman/mason.nvim",
            opts = {
                ui = {
                    border = "single",
                }
            },
            dependencies = {
                "mfussenegger/nvim-dap",
                {
                    "jose-elias-alvarez/null-ls.nvim",
                    opts = {},
                },
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
            opts = {
                handlers = {},
            },
            dependencies = {
                "williamboman/mason.nvim",
                "mfussenegger/nvim-dap",
            },
        },

        {
            "catppuccin/nvim",
            name = "catppuccin",
            priority = 100,
            opts = {
                flavour = "macchiato", -- latte, frappe, macchiato, mocha
                transparent_background = false,
                integrations = {
                    gitsigns = true,
                    harpoon = true,
                    which_key = true,
                    nvimtree = true,
                    telescope = true,
                    treesitter = true,
                    lsp_saga = true,
                    mason = true,
                    neotree = true,
                    cmp = true,
                    indent_blankline = {
                        enabled = true,
                        colored_indent_levels = false,
                    },
                    dap = {
                        enabled = true,
                    },
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                        },
                        underlines = {
                            errors = { "underline" },
                            hints = { "underline" },
                            warnings = { "underline" },
                            information = { "underline" },
                        },
                    },
                    navic = {
                        enabled = true,
                        custom_bg = "NONE",
                    },
                },
            },
        },

        {
            "ThePrimeagen/harpoon",
            event = "VeryLazy",
            dependencies = {
                "nvim-lua/plenary.nvim",
            },
            opts = {},
        },

        {
            "glepnir/lspsaga.nvim",
            event = "LspAttach",
            cmd = "Lspsaga term_toggle",
            config = function()
                require("lspsaga").setup({})
            end,
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            },
        },

        {
            "nvim-treesitter/nvim-treesitter",
            event = { "BufReadPre", "BufNewFile" },
            opts = function()
                require 'nvim-treesitter.configs'.setup {
                    ensure_install = {
                        "markdown",
                        "markdown_inline",
                    },
                    auto_install = true,
                    highlight = {
                        enable = true,
                        disable = {"latex"},
                    },
                }
                require 'nvim-treesitter.install'.compilers = { 'clang' }
            end
        },

        {
            "folke/trouble.nvim",
            cmd = "TroubleToggle",
            opts = {},
        },

        {
            "L3MON4D3/LuaSnip",
            build = (not jit.os:find("Windows"))
                and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
                or nil,
            dependencies = {
                "rafamadriz/friendly-snippets",
                config = function()
                    require("luasnip.loaders.from_vscode").lazy_load()
                end,
            },
            opts = {
                enable_autosnippets = true,
                history = true,
                delete_check_events = "TextChanged",
            },
        },

        {
            "gelguy/wilder.nvim",
            event = "VeryLazy",
            opts = {
                modes = { ':', '/', '?' }
            }
        },

        {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            opts = function()
                local cmp_autopairs = require('nvim-autopairs.completion.cmp')
                local cmp = require("cmp")
                cmp.event:on(
                    'confirm_done',
                    cmp_autopairs.on_confirm_done()
                )
            end
        },

        {
            "windwp/nvim-ts-autotag",
            event = { "BufReadPre", "BufNewFile" },
            dependencies = {
                "nvim-treesitter/nvim-treesitter",
            },
            opts = {
                autotag = { enable = true },
            }
        },

        {
            "folke/zen-mode.nvim",
            cmd = "ZenMode",
            opts = {},
        },

        {
            "LhKipp/nvim-nu",
            ft = "nu",
            build = ":TSInstall nu",
            opts = {},
        },

        {
            "rhysd/conflict-marker.vim",
            event = "VeryLazy",
        },

        {
            "lervag/vimtex",
            ft = "tex",
            config = function()
                if vim.fn.has("wsl") then
                    vim.g.vimtex_view_general_viewer = 'wslview'
                else
                    vim.g.vimtex_view_method = 'zathura'
                end

                vim.g.vimtex_compiler_method = 'tectonic'
                vim.g.vimtex_compiler_options = '--shell-escape'
            end,
        }
    },

    ui = {
        border = "single",
        title = "Lazy"
    }
})

-- Luasnip Setup
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/snippets/"})

-- Wilder setup
local wilder = require('wilder')

wilder.set_option('renderer', wilder.renderer_mux({
    [':'] = wilder.popupmenu_renderer({
        highlighter = wilder.basic_highlighter(),
        left = { ' ', wilder.popupmenu_devicons() },
        right = { ' ', wilder.popupmenu_scrollbar() },
    }),
    ['/'] = wilder.wildmenu_renderer({
        highlighter = wilder.basic_highlighter(),
    }),
}))
