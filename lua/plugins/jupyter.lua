return {
	{
		"benlubas/molten-nvim",
		version = "^1.0.0",
		dependencies = { "3rd/image.nvim" },
		build = ":UpdateRemotePlugins",
		init = function()
			vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_output_win_max_height = 20
			vim.g.molten_wrap_output = true
			vim.g.molten_virt_text_output = true
			vim.g.molten_virt_lines_off_by_1 = true
		end,
	},

	{
		"3rd/image.nvim",
		opts = {
			backend = "kitty",
			max_width = 100,
			max_height = 12,
			max_height_window_percentage = math.huge,
			max_width_window_percentage = math.huge,
			window_overlap_clear_enabled = true,
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
		},
	},

	{
		"GCBallesteros/jupytext.nvim",
		lazy = false,
		ft = { "ipynb" },
		opts = {
			style = "markdown",
			output_extension = "md",
			force_ft = "markdown",
		},
	},
	{
		"quarto-dev/quarto-nvim",
		lazy = false,
		dependencies = {
			"jmbuhr/otter.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		ft = { "quarto", "markdown", "ipynb" },
		config = function()
			require("quarto").setup({
				codeRunner = {
					enabled = true,
					default_method = "molten",
					ft_runners = { python = "molten" }, -- Inside setup!
				},
			})
			-- autocmd for .ipynb
			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "*.ipynb",
				callback = function()
					if vim.bo.filetype ~= "quarto" then
						vim.cmd("QuartoActivate")
					end
				end,
			})
		end,
	},
	{
		"GCBallesteros/NotebookNavigator.nvim",
		dependencies = { "benlubas/molten-nvim" },
		config = true,
	},
}
