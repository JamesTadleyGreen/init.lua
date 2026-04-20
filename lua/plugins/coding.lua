return {
	-- {
	-- 	"Exafunction/codeium.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"hrsh7th/nvim-cmp",
	-- 	},
	-- 	config = function()
	-- 		require("codeium").setup({ enable_chat = true })
	-- 	end,
	-- },
	{
		"frankroeder/parrot.nvim",
		dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim", "folke/noice.nvim" },
		-- optionally include "folke/noice.nvim" or "rcarriga/nvim-notify" for beautiful notifications
		config = function()
			require("parrot").setup({
				-- Providers must be explicitly set up to make them available.
				providers = {
					perplexity = {
						name = "perplexity",
						api_key = "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",
						endpoint = "https://api.perplexity.ai/chat/completions",
						headers = function(self)
							return {
								["Content-Type"] = "application/json",
								["Accept"] = "application/json",
								["Authorization"] = "Bearer " .. self.api_key,
							}
						end,
						topic = {
							model = "r1-1776",
							params = {
								max_tokens = 64,
							},
						},
						models = {
							"sonar",
							"sonar-pro",
							"sonar-deep-research",
							"sonar-reasoning",
							"sonar-reasoning-pro",
							"r1-1776",
						},
					},
				},
			})
		end,
	},
}
