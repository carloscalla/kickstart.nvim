return {
  {
    'akinsho/toggleterm.nvim',
    cmd = { 'ToggleTerm', 'TermNew', 'TermExec', 'TermSelect' },
    -- opts = {
    --   size = function(term)
    --     if term.direction == 'horizontal' then
    --       return vim.o.lines * 0.37
    --     elseif term.direction == 'vertical' then
    --       return vim.o.columns * 0.37
    --     end
    --   end,
    --   direction = 'horizontal',
    -- },
    config = function(_, opts)
      -- For some reason this way of calling setup is not working.
      -- I'm calling setup with opts directly in the setup function below.
      -- require('toggleterm').setup { opts }

      require('toggleterm').setup {
        size = function(term)
          if term.direction == 'horizontal' then
            return vim.o.lines * 0.37
          elseif term.direction == 'vertical' then
            return vim.o.columns * 0.37
          end
        end,
        direction = 'horizontal',
      }

      _G.Toggleterm = _G.Toggleterm or {}

      local Terminal = require('toggleterm.terminal').Terminal

      local gh_dash = Terminal:new {
        cmd = 'gh dash',
        dir = 'git_dir',
        direction = 'float',
        on_open = function(term)
          vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<Esc>', '<Esc>', { nowait = true })
        end,
      }

      _G.Toggleterm._gh_dash_toggle = function()
        gh_dash:toggle()
      end

      -- local lazygit = Terminal:new {
      --   cmd = 'lazygit',
      --   dir = 'git_dir',
      --   direction = 'float',
      --   on_open = function(term)
      --     vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<Esc>', '<Esc>', { nowait = true })
      --     vim.cmd [[ setlocal filetype=lazygit ]]
      --   end,
      -- }
      --
      -- _G.Toggleterm._lazygit_toggle = function()
      --   lazygit:toggle()
      -- end
    end,
    keys = {
      { '<leader>tt', '<Cmd>ToggleTerm<CR>', desc = 'Toggle Terminal' },
      { '<leader>tn', '<Cmd>TermNew<CR>', desc = 'New Terminal' },
      {
        '<leader>G',
        function()
          _G.Toggleterm._gh_dash_toggle()
        end,
        desc = 'Github dash',
      },
      -- {
      --   '<leader>lg',
      --   function()
      --     _G.Toggleterm._lazygit_toggle()
      --   end,
      --   desc = 'LazyGit Toggleterm',
      -- },
    },
  },
}
