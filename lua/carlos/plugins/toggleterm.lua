return {
  {
    'akinsho/toggleterm.nvim',
    opts = {
      size = 30,
      direction = 'horizontal',
    },
    config = function(_, opts)
      require('toggleterm').setup { opts }

      local Terminal = require('toggleterm.terminal').Terminal
      local gh_dash = Terminal:new {
        cmd = 'gh dash',
        dir = 'git_dir',
        direction = 'float',
        on_open = function(term)
          vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<Esc>', '<Esc>', { nowait = true })
        end,
      }

      _G.Toggleterm = _G.Toggleterm or {}

      function _G.Toggleterm._gh_dash_toggle()
        gh_dash:toggle()
      end
    end,
    keys = {
      { '<leader>tt', '<Cmd>ToggleTerm<CR>', desc = 'Toggle Terminal' },
      { '<leader>tn', '<Cmd>TermNew<CR>', desc = 'New Terminal' },
      {
        '<leader>tG',
        function()
          _G.Toggleterm._gh_dash_toggle()
        end,
        desc = 'Toggle gh dash',
      },
    },
  },
}
