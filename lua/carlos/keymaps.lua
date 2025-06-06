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

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '[e', function()
  vim.diagnostic.jump { count = -1, float = true, severity = vim.diagnostic.severity.ERROR }
end, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']e', function()
  vim.diagnostic.jump { count = 1, float = true, severity = vim.diagnostic.severity.ERROR }
end, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic Location list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode

-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.api.nvim_create_autocmd('TermOpen', {
  callback = function()
    if vim.bo.filetype == 'lazygit' then
      -- If it is, we don't want to set the terminal exit mapping
      return
    end

    vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode', buffer = 0 })
  end,
})

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>')

vim.keymap.set('n', '<leader>wh', '<C-W>h')
vim.keymap.set('n', '<leader>wj', '<C-W>j')
vim.keymap.set('n', '<leader>wk', '<C-W>k')
vim.keymap.set('n', '<leader>wl', '<C-W>l')
vim.keymap.set('n', '<leader>ww', '<C-W>w')
vim.keymap.set('n', '<leader>wx', '<C-W>x')
vim.keymap.set('n', '<leader>wL', '<C-W>L')
vim.keymap.set('n', '<leader>wH', '<C-W>H')
vim.keymap.set('n', '<leader>wK', '<C-W>K')
vim.keymap.set('n', '<leader>wJ', '<C-W>J')
vim.keymap.set('n', '<leader>wq', '<C-W>q')
vim.keymap.set('n', '<leader>wo', '<C-W>o')
vim.keymap.set('n', '<C-q>', '<C-W>q')

vim.keymap.set('n', '<Up>', '5<C-y>')
vim.keymap.set('n', '<Down>', '5<C-e>')

vim.keymap.set('x', '<leader>p', [["_dP]])
vim.keymap.set('v', '<leader>d', [["_d]])
vim.keymap.set('n', '<leader>d', [["_d]])

vim.keymap.set('n', ']q', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '[q', '<cmd>cprev<CR>zz')
vim.keymap.set('n', ']l', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '[l', '<cmd>lprev<CR>zz')

-- Commenting them out since <CR> interferes with the search performed in this mapping
-- Also I barely use this nowadays. Treesitter and textobjects have improved this experience a lot
-- vim.keymap.set('n', '[[', '?{<CR>w99[{')
-- vim.keymap.set('n', '][', '/}<CR>b99]}')
-- vim.keymap.set('n', ']]', 'j0[[%/{<CR>')
-- vim.keymap.set('n', '[]', 'k$][%?}<CR>')
