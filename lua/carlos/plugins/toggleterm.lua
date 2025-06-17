return {
  {
    'akinsho/toggleterm.nvim',
    opts = {
      size = 30,
      direction = 'horizontal',
    },
    config = function(_, opts)
      require('toggleterm').setup { opts }

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
  {
    -- Open files and command output from wezterm, kitty, and neovim terminals in
    -- your current neovim instance
    'willothy/flatten.nvim',
    -- Ensure that it runs first to minimize delay when opening file from terminal
    lazy = false,
    priority = 1001,
    enabled = false, -- Disabling because it breaks neotest :(
    opts = function()
      ---@type Terminal?
      local saved_terminal

      return {
        window = {
          open = 'alternate',
        },
        hooks = {
          pre_open = function()
            local term = require 'toggleterm.terminal'
            local termid = term.get_focused_id()
            saved_terminal = term.get(termid)
          end,
          post_open = function(bufnr, winnr, ft, is_blocking)
            if saved_terminal and vim.bo[saved_terminal.bufnr].filetype == 'lazygit' then
              saved_terminal:shutdown()
            else
              -- If it's a normal file, just switch to its window
              vim.api.nvim_set_current_win(winnr)
            end
          end,
        },
      }
    end,
  },
}
