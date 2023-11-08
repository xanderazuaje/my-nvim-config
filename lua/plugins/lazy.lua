return {
    -- Theme
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        name = "nvim-tree",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            { "<C-n>", "<cmd>NvimTreeToggle<CR>"},
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },
    -- Highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        build = ":TSUpdate",
        name = "nvim-treesitter",
        opts = {
            matchup = { enable = true },
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = { "bash", "c", "diff", "html", "javascript", "jsdoc", "json", "jsonc", "lua", "luadoc", "luap", "markdown", "markdown_inline", "python", "query", "regex", "toml", "tsx", "typescript", "vim", "vimdoc", "yaml", },
        },
        config = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                ---@type table<string, boolean>
                local added = {}
                opts.ensure_installed = vim.tbl_filter(function(lang)
                    if added[lang] then
                        return false
                    end
                    added[lang] = true
                    return true
                end, opts.ensure_installed)
            end
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    -- LSP
    {"williamboman/mason.nvim"},
    {"williamboman/mason-lspconfig.nvim"},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.on_attach(function(_, bufnr)
                lsp_zero.default_keymaps({buffer = bufnr})
            end)

            require("mason").setup {}
            require("mason-lspconfig").setup ({
                ensure_installed = {},
                handlers = {
                    lsp_zero.default_setup,
                },
            })
        end
    },
    -- Git plugins
    {
        "lewis6991/gitsigns.nvim",
        name = "gitsigns",
        config = function()
            require("gitsigns").setup({})
        end,
    },
    {
        "tpope/vim-fugitive",
        name = "vim-fugitive",
        config = function()
        end,
    },
    -- AI integration
    {
        "github/copilot.vim"
    },
};
