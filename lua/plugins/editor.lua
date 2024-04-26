return {
	{
		"stevearc/oil.nvim",
		opts = { skip_confirm_for_simple_edits = false },
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{ "ggandor/leap.nvim" },
	{ "tpope/vim-commentary" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-repeat" },
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		-- tag = "*",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = "~/notes",
							},
						},
					},
				},
			})
		end,
	},
}
