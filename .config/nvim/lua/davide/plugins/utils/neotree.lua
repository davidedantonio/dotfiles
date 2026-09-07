return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"saifulapm/neotree-file-nesting-config",
	},
	opts = {
		-- recommanded config for better UI
		hide_root_node = true,
		retain_hidden_root_indent = true,
		default_component_configs = {
			indent = {
				with_expanders = true,
				expander_collapsed = "",
				expander_expanded = "",
			},
		},
		window = {
			position = "left",
			width = 40,
			mapping_options = {
				noremap = true,
				nowait = true,
			},
			mappings = {
				["<space>"] = {
					"toggle_node",
					nowait = false,
				},
				["<2-LeftMouse>"] = "open",
				["<cr>"] = "open",
				["<esc>"] = "cancel",
				["P"] = { "toggle_preview", config = { use_float = true } },
				["l"] = "focus_preview",
				["S"] = "open_split",
				["s"] = "open_vsplit",
				["t"] = "open_tabnew",
				["w"] = "open_with_window_picker",
				["C"] = "close_node",
				["z"] = "close_all_nodes",
				["Z"] = "expand_all_nodes",
				["a"] = {
					"add",
					config = {
						show_path = "none",
					},
				},
				["A"] = "add_directory",
				["d"] = "delete",
				["r"] = "rename",
				["y"] = "copy_to_clipboard",
				["x"] = "cut_to_clipboard",
				["p"] = "paste_from_clipboard",
				["c"] = "copy",
				["m"] = "move",
				["q"] = "close_window",
				["R"] = "refresh",
				["?"] = "show_help",
				["<"] = "prev_source",
				[">"] = "next_source",
				["i"] = "show_file_details",
			},
		},
		filesystem = {
			filtered_items = {
				visible = false,
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_hidden = true,
				hide_by_name = {
					"node_modules",
					"build",
				},
				hide_by_pattern = {
					"*.meta",
					"*/src/*/tsconfig.json",
				},
				always_show = {
					".gitignored",
					".env",
				},
				never_show = {
					".DS_Store",
				},
			},
			follow_current_file = {
				enabled = false,
				leave_dirs_open = false,
			},
			group_empty_dirs = false,
			hijack_netrw_behavior = "open_default",
			use_libuv_file_watcher = false,
			window = {
				mappings = {
					["<bs>"] = "navigate_up",
					["."] = "set_root",
					["H"] = "toggle_hidden",
					["/"] = "fuzzy_finder",
					["D"] = "fuzzy_finder_directory",
					["#"] = "fuzzy_sorter",
					["f"] = "filter_on_submit",
					["<c-x>"] = "clear_filter",
					["[g"] = "prev_git_modified",
					["]g"] = "next_git_modified",
					["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
					["oc"] = { "order_by_created", nowait = false },
					["od"] = { "order_by_diagnostics", nowait = false },
					["og"] = { "order_by_git_status", nowait = false },
					["om"] = { "order_by_modified", nowait = false },
					["on"] = { "order_by_name", nowait = false },
					["os"] = { "order_by_size", nowait = false },
					["ot"] = { "order_by_type", nowait = false },
				},
				fuzzy_finder_mappings = {
					["<down>"] = "move_cursor_down",
					["<C-n>"] = "move_cursor_down",
					["<up>"] = "move_cursor_up",
					["<C-p>"] = "move_cursor_up",
				},
			},
		},
	},
	config = function(_, opts)
		opts.nesting_rules = require("neotree-file-nesting-config").nesting_rules
		require("neo-tree").setup(opts)
	end,
}
