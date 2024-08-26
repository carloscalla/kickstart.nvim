return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- local actions = require 'fzf-lua.actions'
    -- calling `setup` is optional for customization
    require('fzf-lua').setup {
      'telescope',
      winopts = {
        preview = {
          horizontal = 'right:50%',
          layout = 'flex',
        },
      },
      previewers = {
        builtin = {
          extensions = {
            ['png'] = { 'chafa', '{file}' },
            ['svg'] = { 'chafa', '{file}' },
            ['jpg'] = { 'chafa', '{file}' },
            ['gif'] = { 'chafa', '{file}' },
            -- ['png'] = { 'viu', '-b' },
            -- ['svg'] = { 'viu', '-b' },
            -- ['jpg'] = { 'viu', '-b' },
          },
        },
      },
      fzf_opts = { ['--layout'] = 'default' },
      grep = {
        winopts = { preview = { layout = 'vertical' } },
      },
      -- keymap = {
      --   fzf = {
      --     ['ctrl-a'] = 'toggle-all',
      --   },
      -- },
      -- actions = {
      --   files = {
      --     ['ctrl-q'] = actions.file_sel_to_qf,
      --     ['ctrl-l'] = actions.file_sel_to_ll,
      --   },
      -- },
    }

    vim.keymap.set('n', '<leader>ff', require('fzf-lua').files, { desc = '[F]ind [F]iles' })
    vim.keymap.set('n', '<leader>pf', require('fzf-lua').live_grep, { desc = '[P]roject [F]ind' })
    vim.keymap.set('n', '<leader>fr', require('fzf-lua').resume, { desc = '[F]zf [R]esume' })
    vim.keymap.set('n', '<leader>ls', require('fzf-lua').buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>fw', require('fzf-lua').grep_cword, { desc = '[ ] Grep cword' })
    vim.keymap.set('n', '<leader>fW', require('fzf-lua').grep_cWORD, { desc = '[ ] Grep cWORD' })
    vim.keymap.set('n', '<leader>fo', require('fzf-lua').oldfiles, { desc = '[ ] Old files' })
    vim.keymap.set('n', '<leader>rg', require('fzf-lua').grep, { desc = '[ ] Grep' })
    vim.keymap.set('v', '<leader>rg', require('fzf-lua').grep_visual, { desc = '[ ] Grep visual' })
  end,
}
