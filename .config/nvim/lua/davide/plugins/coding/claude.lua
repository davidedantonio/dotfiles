return {
	"coder/claudecode.nvim",
	dependencies = {
		"folke/snacks.nvim",
	},
	config = true,
	cmd = {
		"ClaudeCode",
		"ClaudeCodeFocus",
		"ClaudeCodeAdd",
		"ClaudeCodeSend",
		"ClaudeCodeStatus",
		"ClaudeCodeStart",
		"ClaudeCodeStop",
	},
	keys = {
		{
			"<leader>ac",
			"<cmd>ClaudeCode<cr>",
			desc = "Claude Code",
		},
		{
			"<leader>as",
			"<cmd>ClaudeCodeSend<cr>",
			mode = { "n", "v" },
			desc = "Invia a Claude",
		},
	},
}
