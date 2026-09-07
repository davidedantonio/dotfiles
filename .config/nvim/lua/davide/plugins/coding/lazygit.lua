return {
	"kdheepak/lazygit.nvim",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
		{ "<leader>lG", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit (current file)" },
	},
	config = function()
		-- Assicura che lazygit usi la directory corretta
		vim.g.lazygit_floating_window_scaling_factor = 0.9
		vim.g.lazygit_floating_window_use_plenary = 1
		vim.g.lazygit_use_neovim_remote = 1

		-- Fix per il working directory
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "lazygit",
			callback = function()
				vim.cmd("setlocal nocursorcolumn")
			end,
		})
	end,
	init = function()
		-- Assicurati che LazyGit parta dalla root del repository
		vim.api.nvim_create_user_command("LazyGit", function()
			local git_root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null"):gsub("\n", "")
			if git_root ~= "" then
				vim.cmd("cd " .. git_root)
			end
			vim.cmd("LazyGit!")
		end, {})
	end,
}
