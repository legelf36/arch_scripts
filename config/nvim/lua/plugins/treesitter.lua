return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		auto_install = true,
		ensure_installed = {
			"bash",
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"regex",
			"tsx",
			"typescript",
			"vim",
			"yaml",
		},
		highlight = { enable = true },
		indent = { enable = true },
	},
	config = function()
		-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
		-- install_dir = vim.fn.stdpath('data') .. '/site',
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "<FileType>" },
			callback = function(args)
				vim.treesitter.start(args.buf)
			end,
		})
	end,
}
