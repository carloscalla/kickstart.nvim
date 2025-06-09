return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  lazy = false,
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    ---[[
    require('mini.surround').setup {
      mappings = {
        add = '', -- Add surrounding in Normal and Visual modes
        delete = '', -- Delete surrounding
        find = 'gsf', -- Find surrounding (to the right)
        find_left = 'gsF', -- Find surrounding (to the left)
        highlight = 'gsh', -- Highlight surrounding
        replace = '', -- Replace surrounding
        update_n_lines = 'gsn', -- Update `n_lines`
        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
      },
      -- Number of lines within which surrounding is searched
      n_lines = 30,
    }
    --]]

    require('mini.files').setup {
      options = {
        use_as_default_explorer = false,
      },
    }

    require('mini.diff').setup {}

    require('mini.move').setup {}
  end,
  keys = {
    {
      '<leader>fb',
      function()
        require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = 'Open mini.files (Directory of Current File)',
    },
    {
      '<leader>id',
      function()
        require('mini.diff').toggle_overlay(vim.api.nvim_get_current_buf())
      end,
      desc = 'Toggle mini.diff overlay',
    },
  },
}
