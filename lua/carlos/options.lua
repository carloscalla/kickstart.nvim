-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable vim-surround default mappings
-- vim.g.surround_no_mappings = true

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
-- vim.opt.timeoutlen = 300

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

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

-- commenting out because I'm not sure if needed anymore
-- vim.g.skip_ts_context_commentstring_module = true

vim.o.termguicolors = true

-- QUICKFIX
vim.cmd [[packadd cfilter]]

if vim.fn.executable 'rg' == 1 then
  vim.o.grepprg = 'rg --vimgrep --no-heading --smart-case'
  -- vim.o.grepformat = '%f:%l:%m'
end
