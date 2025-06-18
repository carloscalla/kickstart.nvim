-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.o`
-- For more options, you can see `:help option-list`

-- Make line numbers default
vim.o.number = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

vim.o.wildmenu = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 5

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
-- Notice listchars is set using `vim.opt` instead of `vim.o`.
-- It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--  See `:help lua-options`
--  and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = 'eol:↩,tab:|·'

vim.opt.fillchars = vim.opt.fillchars + 'diff: '

-- Configure how new splits should be opened
vim.o.splitbelow = true
vim.o.splitright = true

vim.wo.relativenumber = true

-- Show which line your cursor is on
vim.o.cursorline = false

vim.o.termguicolors = true

-- Enable folding with treesitter
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo.foldcolumn = '0'
vim.o.foldlevelstart = 99
vim.wo.foldenable = true

-- Quickfix
vim.cmd [[packadd cfilter]]

if vim.fn.executable 'rg' == 1 then
  vim.o.grepprg = 'rg -H --vimgrep --no-heading --smart-case'
  -- Default grep format for quickfix window when grepprg is available
  -- vim.o.grepformat = '%f:%l:%c:%m'
end

pcall(require, 'custom.options')
