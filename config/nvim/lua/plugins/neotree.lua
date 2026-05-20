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
		})
	end,
}
