-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
-- NOTE: Commenting this out in favor of Yanky
--
-- vim.api.nvim_create_autocmd('TextYankPost', {
--   desc = 'Highlight when yanking (copying) text',
--   group = vim.api.nvim_create_augroup('neoBim-highlight-yank', { clear = true }),
--   callback = function()
--     vim.hl.on_yank()
--   end,
-- })

-- NOTE: I added this when I set up Obsidian
-- I'm disabling Obsidian ui features to prioritize render-markdown.nvim
--
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = { 'markdown' },
--   callback = function()
--     vim.wo[vim.api.nvim_get_current_win()][0].conceallevel = 1
--   end,
-- })

pcall(require, 'custom.autocmds')
