return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		{
			"windwp/nvim-ts-autotag",
			opts = {},
			ft = {
				"javascriptreact",
				"typescriptreact",
				"javascript",
				"typescript",
				"html",
				"vue",
				"php",
				"python",
			},
		},
	},
	config = function()
		-- Installa/aggiorna i parser (API del branch "main")
		require("nvim-treesitter").install({
			"json",
			"javascript",
			"typescript",
			"tsx",
			"yaml",
			"html",
			"css",
			"prisma",
			"markdown",
			"markdown_inline",
			"svelte",
			"graphql",
			"bash",
			"lua",
			"vim",
			"dockerfile",
			"gitignore",
			"query",
			"vimdoc",
			"c",
			"cpp",
			"python",
			"java",
		})

		-- usa il parser bash anche per i file zsh
		vim.treesitter.language.register("bash", "zsh")

		-- Sul branch "main" highlight/indent vanno attivati manualmente per buffer
		local group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true })
		local ignore_filetypes = {
			"checkhealth",
			"lazy",
			"mason",
			"snacks_dashboard",
			"snacks_notif",
			"snacks_win",
		}

		vim.api.nvim_create_autocmd("FileType", {
			group = group,
			desc = "Enable treesitter highlighting and indentation",
			callback = function(event)
				if vim.tbl_contains(ignore_filetypes, event.match) then
					return
				end
				local lang = vim.treesitter.language.get_lang(event.match) or event.match
				local buf = event.buf

				pcall(vim.treesitter.start, buf, lang)

				vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
