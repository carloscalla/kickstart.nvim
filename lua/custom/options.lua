vim.o.wildmenu = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 2

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.o.list = true
vim.o.listchars = 'eol:↩,tab:<·>'

-- Configure how new splits should be opened
vim.o.splitbelow = true
vim.o.splitright = true

vim.wo.relativenumber = true

-- Show which line your cursor is on
vim.o.cursorline = false

vim.g.skip_ts_context_commentstring_module = true

vim.o.termguicolors = true
