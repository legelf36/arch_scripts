return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},
	lazy = false, -- neo-tree will lazily load itself
	config = function()
		vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>{}")
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true, -- Shows all items, hiding only those explicitly filtered
					hide_dotfiles = false, -- Ensures dotfiles are visible
					hide_gitignored = true, -- Hides files listed in .gitignore
					hide_by_name = {
						-- '.git',
						-- '.DS_Store',
					},
					never_show = {},
				},
			},
			default_component_configs = {
				git_status = {
					symbols = {
						-- Change type
						added = "✚", -- NOTE: you can set any of these to an empty string to not show them
						deleted = "✖",
						modified = "",
						renamed = "󰁕",
						-- Status type
						untracked = "",
						ignored = "",
						unstaged = "󰄱",
						staged = "",
						conflict = "",
					},
					align = "right",
				},
				file_size = {
					enabled = true,
					width = 12, -- width of the column
					required_width = 49, -- min width of window required to show this column
				},
				last_modified = {
					enabled = true,
					width = 12, -- width of the column
					required_width = 49, -- min width of window required to show this column
					format = "%Y-%m-%d %I:%M %p", -- format string for timestamp (see `:h os.date()`)
					-- or use a function that takes in the date in seconds and returns a string to display
					--format = require("neo-tree.utils").relative_date, -- enable relative timestamps
				},
			},
			window = {
				position = "left", -- left, right, top, bottom, float, current
				width = 50, -- applies to left and right positions
				height = 15, -- applies to top and bottom positions
				auto_expand_width = true, -- expand the window when file exceeds the window width. does not work with position = "float"
				popup = { -- settings that apply to float position only
					size = {
						height = "80%",
						width = "50%",
					},
					position = "50%", -- 50% means center it
					title = function(state) -- format the text that appears at the top of a popup window
						return "Neo-tree " .. state.name:gsub("^%l", string.upper)
					end,
					-- you can also specify border here, if you want a different setting from
					-- the global popup_border_style.
				},
			},
		})
	end,
}
