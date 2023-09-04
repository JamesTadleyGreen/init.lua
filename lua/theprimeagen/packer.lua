-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    use({
        "rose-pine/neovim",
        as = "rose-pine",
        config = function()
            vim.cmd("colorscheme rose-pine")
        end,
    })

    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        -- or                            , branch = '0.1.x',
        requires = { "nvim-lua/plenary.nvim" },
    })

    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("nvim-treesitter/playground")
    use("theprimeagen/harpoon")
    use("mbbill/undotree")

    use({
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp-signature-help" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
    })

    use("Exafunction/codeium.vim")
    use("pbrisbin/vim-syntax-shakespeare")
    use("habamax/vim-godot")
    use("mfussenegger/nvim-dap")

    use({
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    })

    use({
        "MrcJkb/haskell-tools.nvim",
        requires = {
            "neovim/nvim-lspconfig",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim", -- optional
        },
    })
    use({
        "danymat/neogen",
        config = function()
            require("neogen").setup({})
        end,
        requires = "nvim-treesitter/nvim-treesitter",
        -- Uncomment next line if you want to follow only stable versions
        tag = "*",
    })
    use("mhartington/formatter.nvim")
    use("tpope/vim-obsession")
    use("tpope/vim-repeat")
    use("tpope/vim-fugitive")
    use("tpope/vim-surround")
    use("tpope/vim-commentary")
    use("tpope/vim-vinegar")
    use("ggandor/leap.nvim")
    use("junegunn/gv.vim")
    -- Statusline
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
    })
    -- Cusor
    use({
        "gen740/SmoothCursor.nvim",
        config = function()
            require("smoothcursor").setup()
        end,
    })
    -- Adding in comment highlighting
    -- TODO: Figure out how to get this working
    use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })
    -- Showing notifications on a project level
    use({
        "folke/trouble.nvim",
        opts = {
            icons = false,
            fold_open = "v",
            fold_closed = ">",
            indent_lines = true,
            signs = {
                error = "error",
                warning = "warn",
                hint = "hint",
                information = "info",
            },
            use_diagnostic_signs = true,
        },
        requires = "nvim-tree/nvim-web-devicons",
    })
    use({
        "ray-x/lsp_signature.nvim",
    })
    --use 'lervag/vimtex'
    use({
        "m4xshen/hardtime.nvim",
        requires = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    })
end)
