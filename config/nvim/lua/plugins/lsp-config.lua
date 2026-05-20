return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "bashls" },
				automatic_enable = true,
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfigl = vim.lsp.config.lua_ls
			local lspconfigj = vim.lsp.config.ts_ls
			local lspconfigb = vim.lsp.config.bashls
			vim.lsp.config(
				"lua_ls",
				vim.tbl_deep_extend("force", lspconfigl or {}, {
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							diagnostics = { globals = { "vim" } },
							telemetry = { enable = false },
						},
					},
					capabilities = capabilities,
				})
			)
			vim.lsp.config(
				"ts_ls",
				vim.tbl_deep_extend("force", lspconfigj or {}, {
					capabilities = capabilities,
				})
			)
			vim.lsp.config(
				"bashls",
				vim.tbl_deep_extend("force", lspconfigb or {}, {
					"bashls",
					vim.tbl_deep_extend("force", lspconfigb or {}, {
						capabilities = capabilities,
					}),
				})
			)
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("bashls")
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			--vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
