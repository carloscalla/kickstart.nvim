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

    vim.keymap.set('n', '<leader>sf', require('fzf-lua').files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sg', require('fzf-lua').live_grep, { desc = '[S]earch by [G]rep' })
    -- vim.keymap.set('n', '<leader>sr', require('fzf-lua').resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>sb', require('fzf-lua').buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>sw', require('fzf-lua').grep_cword, { desc = '[ ] Grep cword' })
    vim.keymap.set('n', '<leader>sW', require('fzf-lua').grep_cWORD, { desc = '[ ] Grep cWORD' })
  end,
}
