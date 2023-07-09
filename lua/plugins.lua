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
            event = { "BufReadPre", "BufNewFile" },
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
                        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
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
                history = true,
                delete_check_events = "TextChanged",
            },
        },

        {
            'norcalli/nvim-colorizer.lua',
            event = "VeryLazy",
            opts = {}
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
            "brenoprata10/nvim-highlight-colors",
            event = { "BufReadPre", "BufNewFile" },
            opts = {}
        },

        {
            "andweeb/presence.nvim",
            event = "VeryLazy",
            opts = {
                -- General options
                auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
                neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
                main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
                client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
                log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
                debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
                enable_line_number  = false,                      -- Displays the current line number instead of the current project
                blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
                buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
                file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
                show_time           = true,                       -- Show the timer

                -- Rich Presence text options
                editing_text        = "Editing %s",         -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
                file_explorer_text  = "Browsing %s",        -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
                git_commit_text     = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
                plugin_manager_text = "Managing plugins",   -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
                reading_text        = "Reading %s",         -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
                workspace_text      = "Working on %s",      -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
                line_number_text    = "Line %s out of %s",  -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
            }
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
        }
    },

    ui = {
        border = "single",
        title = "Lazy"
    }
})

-- Tresitter setup

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
