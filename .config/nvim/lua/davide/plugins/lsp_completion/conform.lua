return {
	"stevearc/conform.nvim",
	event = { "BufWritePre", "InsertEnter", "LspAttach" },
	opts = {
		formatters_by_ft = {
			javascript = { "biome-organize-imports", "biome" },
			typescript = { "biome-organize-imports", "biome" },
			javascriptreact = { "biome-organize-imports", "biome" },
			typescriptreact = { "biome-organize-imports", "biome" },
			json = { "biome" },
			jsonc = { "biome" },
			svelte = { "prettier" },
			css = { "biome" },
			html = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			graphql = { "prettier" },
			liquid = { "prettier" },
			lua = { "stylua" },
			python = { "isort", "black" },
		},
		format_on_save = {
			lsp_format = "fallback",
			timeout_ms = 2000,
		},
	},
	keys = {
		{
			mode = { "n", "v" },
			"<leader>Fm",
			function()
				require("conform").format({
					lsp_format = "fallback",
					timeout_ms = 2000,
				})
			end,
			desc = "Conform: Format Manually",
		},
	},
}
