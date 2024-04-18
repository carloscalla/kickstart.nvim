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

vim.keymap.set('x', '<leader>p', [["_dP]])
vim.keymap.set('v', '<leader>d', [["_d]])
vim.keymap.set('n', '<leader>d', [["_d]])

vim.keymap.set('n', '<leader>ll', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<leader>hh', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>jj', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>kk', '<cmd>lprev<CR>zz')

vim.keymap.set('n', '[[', '?{<CR>w99[{')
vim.keymap.set('n', '][', '/}<CR>b99]}')
vim.keymap.set('n', ']]', 'j0[[%/{<CR>')
vim.keymap.set('n', '[]', 'k$][%?}<CR>')

-- Plugin Remaps

-- Neo-tree
vim.keymap.set('n', '<leader>nt', ':Neotree float toggle<CR>')
vim.keymap.set('n', '<leader>fi', ':Neotree float reveal<CR>')
vim.keymap.set('n', '<leader>fo', ':Neotree float focus<CR>')

-- Harpoon
vim.keymap.set('n', '<leader>ha', "<cmd>lua require('harpoon.mark').add_file()<CR>", {})
vim.keymap.set('n', '<leader>ht', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", {})
vim.keymap.set('n', '<leader>hp', "<cmd>lua require('harpoon.ui').nav_prev()<CR>", {})
vim.keymap.set('n', '<leader>hn', "<cmd>lua require('harpoon.ui').nav_next()<CR>", {})

-- Prettier
-- vim.keymap.set('n', '<leader>pp', '<Plug>(PrettierAsync)')

-- Undotree
vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<CR>')
