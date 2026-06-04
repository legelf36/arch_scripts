vim.cmd("set expandtab") -- ?
vim.cmd("set tabstop=2") -- 2 spaces for <tab>
vim.cmd("set softtabstop=2") -- 2 spaces for <tab> or <backspace>
vim.cmd("set shiftwidth=2") -- indent commands use 2 spaces
vim.g.netrw_banner = 0 -- disables netrw banner

vim.opt.number = true -- Line number
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.wrap = false -- do not wrap lines by default
vim.opt.scrolloff = 20 -- Keep 20 lines above and below the cursor

vim.opt.smartindent = true -- smart auto-indent
vim.opt.inccommand = "split" -- Preview window for substitution commands
vim.opt.splitbelow = true -- All horizontal splits forced below the current window
vim.opt.splitright = true -- All vertical splits forced to the right of current window

vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- case sensitive if uppercase in string
vim.opt.laststatus = 0 -- hide unified statusline
--vim.opt.guicursor = "" -- use terminal cursor

vim.opt.signcolumn = "yes" -- always show a sign column
--vim.opt.colorcolumn = "100" -- show a column at 100 char position
vim.opt.termguicolors = true -- enable 24-bit color
vim.opt.cmdheight = 1 -- hide command line interface (0) when not active
vim.opt.showmatch = true -- highlight matching brackets

vim.opt.pumheight = 10 -- popup menu height
vim.opt.pumblend = 10 -- popup menu transparency
vim.opt.fillchars = { eob = " " } -- hide "~" on empty lines

-- enable built-in yank highlighting for 300ms
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.hl.on_yank({
			timeout = 300, -- set timeout
		})
	end,
})
