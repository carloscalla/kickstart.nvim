-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

vim.o.hlsearch = true

-- Clears hlsearch after doing a search, otherwise just does normal <CR> stuff
-- Use <C-L> neovim builtin mapping for clearing
vim.cmd [[ nnoremap <expr> <CR> {-> v:hlsearch ? "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>" : "<CR>"}() ]]
-- I'm mapping <C-l> to switch windows below
-- One can also use :mode to clear and redraw the screen or capital L, Ctrl+Shift+l

-- Commenting this because I set Oil as my default file explorer
-- vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

local diagnostics_float_opts = {
  max_width = 80,
}
-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = diagnostics_float_opts }
end, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = diagnostics_float_opts }
end, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '[e', function()
  vim.diagnostic.jump { count = -1, float = diagnostics_float_opts, severity = vim.diagnostic.severity.ERROR }
end, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']e', function()
  vim.diagnostic.jump { count = 1, float = diagnostics_float_opts, severity = vim.diagnostic.severity.ERROR }
end, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', function()
  vim.diagnostic.open_float(diagnostics_float_opts)
end, { desc = 'Show diagnostic messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic Location list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  Disabling them as vim-tmux-navigator is handling this for me
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>', { desc = "Change cwd to current file's directory" })

-- vim.keymap.set('n', '<leader>wh', '<C-W>h', { desc = 'Go to the left window' })
-- vim.keymap.set('n', '<leader>wj', '<C-W>j', { desc = 'Go to the down window' })
-- vim.keymap.set('n', '<leader>wk', '<C-W>k', { desc = 'Go to the up window' })
-- vim.keymap.set('n', '<leader>wl', '<C-W>l', { desc = 'Go to the right window' })
vim.keymap.set('n', '<leader>w=', '<cmd>wincmd =<cr>', { desc = 'Make all windows same size' })
vim.keymap.set('n', '<leader>ww', '<C-W>w', { desc = 'Move focus to the next window' })
vim.keymap.set('n', '<leader>wx', '<C-W>x', { desc = 'Swap current window with the next one' })
vim.keymap.set('n', '<leader>wL', '<C-W>L', { desc = 'Move window to far right' })
vim.keymap.set('n', '<leader>wH', '<C-W>H', { desc = 'Move window to far left' })
vim.keymap.set('n', '<leader>wK', '<C-W>K', { desc = 'Move window to far top' })
vim.keymap.set('n', '<leader>wJ', '<C-W>J', { desc = 'Move window to far bottom' })
vim.keymap.set('n', '<leader>wq', '<C-W>q', { desc = 'Close current window' })
vim.keymap.set('n', '<leader>wo', '<C-W>o', { desc = 'Close all other windows' })
vim.keymap.set('n', '<C-q>', '<C-W>q', { desc = 'Close current window' })

vim.keymap.set('n', '<Up>', '5<C-y>')
vim.keymap.set('n', '<Down>', '5<C-e>')

vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste using the black hole register' })
vim.keymap.set('v', '<leader>d', [["_d]], { desc = 'Delete using the black hole register' })
vim.keymap.set('n', '<leader>d', [["_d]], { desc = 'Delete using the black hole register' })

vim.keymap.set('n', ']q', '<cmd>cnext<CR>zz', { desc = 'Go to next quickfix item' })
vim.keymap.set('n', '[q', '<cmd>cprev<CR>zz', { desc = 'Go to previous quickfix item' })
vim.keymap.set('n', ']l', '<cmd>lnext<CR>zz', { desc = 'Go to next location list item' })
vim.keymap.set('n', '[l', '<cmd>lprev<CR>zz', { desc = 'Go to previous location list item' })

-- Commenting them out since <CR> interferes with the search performed in this mapping
-- Also I barely use this nowadays. Treesitter and textobjects have improved this experience a lot
-- vim.keymap.set('n', '[[', '?{<CR>w99[{')
-- vim.keymap.set('n', '][', '/}<CR>b99]}')
-- vim.keymap.set('n', ']]', 'j0[[%/{<CR>')
-- vim.keymap.set('n', '[]', 'k$][%?}<CR>')

pcall(require, 'custom.keymaps')
