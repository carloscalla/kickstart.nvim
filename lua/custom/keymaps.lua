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

vim.keymap.set('n', '<Up>', '3<C-y>')
vim.keymap.set('n', '<Down>', '3<C-e>')


-- Plugin Remaps

-- NERDTree
-- vim.keymap.set('n', '<leader>nt', ':NERDTreeToggle<CR>')
-- vim.keymap.set('n', '<leader>fi', ':NERDTreeFind<CR>')
-- vim.keymap.set('n', '<leader>fo', ':NERDTreeFocus<CR>')

-- Neo-tree
vim.keymap.set('n', '<leader>nt', ':Neotree float toggle<CR>')
vim.keymap.set('n', '<leader>fi', ':Neotree float reveal<CR>')
vim.keymap.set('n', '<leader>fo', ':Neotree float focus<CR>')

-- Harpoon
vim.keymap.set("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>", {})
vim.keymap.set("n", "<leader>ht", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", {})
vim.keymap.set("n", "<leader>hh", "<cmd>lua require('harpoon.ui').nav_prev()<CR>", {})
vim.keymap.set("n", "<leader>ll", "<cmd>lua require('harpoon.ui').nav_next()<CR>", {})

-- Prettier
vim.keymap.set('n', '<leader>pp', '<Plug>(PrettierAsync)')

-- Undotree
vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<CR>')

-- Copilot
vim.keymap.set('i', '<C-y>', 'copilot#Accept()', { noremap = true, expr = true, silent = true, replace_keycodes = false })
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
