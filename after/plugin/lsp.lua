local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.configure("hls", {
	settings = {
		haskell = {
			-- haskell-language-server options
			formattingProvider = "ormolu",
			checkProject = true, -- Setting this to true could have a performance impact on large mono repos.
		},
	},
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	if client.name == "eslint" then
		vim.cmd.LspStop("eslint")
		return
	end

	require("lsp_signature").on_attach({
		bind = true, -- This is mandatory, otherwise border config won't get registered.
		hint_enable = false,
		handler_opts = {
			border = "rounded",
		},
	}, bufnr)

	require("lspconfig").clangd.setup({
		on_attach = function(client, bufnr)
			require("nvim-navic").attach(client, bufnr)
		end,
	})

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>vw", vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "<leader>vc", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>vr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>vn", vim.lsp.buf.rename, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<C-/>", vim.lsp.buf.formatting_sync, opts)

	-- Format on save
	vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	-- Replace the language servers listed here
	-- with the ones you want to install
	ensure_installed = { "lua_ls", "pylsp", "hls" },
	handlers = {
		lsp.default_setup,
	},
})

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})
