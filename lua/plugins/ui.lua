return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		config = function()
			vim.fn["mkdp#util#install"]()
			vim.keymap.set("n", "<leader>m", ":MarkdownPreview<CR>")
		end,
	},
}
