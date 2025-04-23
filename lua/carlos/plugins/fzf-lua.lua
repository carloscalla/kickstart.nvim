return {
  'ibhagwan/fzf-lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'folke/snacks.nvim',
  },
  config = function()
    local actions = require 'fzf-lua.actions'
    -- Force image module to load
    require 'snacks.image'
    require('fzf-lua').setup {
      -- 'telescope',
      -- fzf_opts = { ['--layout'] = 'default' },
      keymap = {
        fzf = {
          true,
          ['ctrl-j'] = 'half-page-down',
          ['ctrl-k'] = 'half-page-up',
          ['ctrl-d'] = 'preview-page-down',
          ['ctrl-u'] = 'preview-page-up',
          ['ctrl-q'] = 'select-all+accept',
        },
        builtin = {
          true,
          ['<C-o>'] = 'toggle-preview',
          ['<C-/>'] = 'toggle-help',
          ['<C-d>'] = 'preview-page-down',
          ['<C-u>'] = 'preview-page-up',
        },
      },
      actions = {
        files = {
          true,
          ['enter'] = actions.file_edit_or_qf,
          ['alt-q'] = actions.file_sel_to_qf,
          ['alt-l'] = actions.file_sel_to_ll,
          ['ctrl-i'] = { fn = actions.toggle_ignore, reuse = true, header = false },
          ['ctrl-h'] = { fn = actions.toggle_hidden, reuse = true, header = false },
        },
      },
      winopts = {
        height = 0.75,
        width = 0.85,
        row = 0.45,
        col = 0.55,
        preview = {
          horizontal = 'right:55%',
          layout = 'flex',
        },
      },
      lines = {
        winopts = {
          width = 0.75,
          preview = {
            layout = 'vertical',
            vertical = 'up:60%',
          },
        },
      },
      previewers = {
        builtin = {
          title_fnamemodify = function(s)
            return vim.fn.fnamemodify(s, ':~:.')
          end,
          snacks_image = { enabled = true },
        },
        codeaction = { toggle_behavior = 'extend' },
      },
      grep = {
        winopts = {
          height = 0.87,
          width = 0.75,
          row = 0.40,
          col = 0.55,
          preview = {
            layout = 'vertical',
            vertical = 'up:60%',
          },
        },
      },
      lsp = {
        code_actions = {
          previewer = 'codeaction',
        },
      },
      oldfiles = {
        include_current_session = true,
        cwd_only = true,
      },
    }

    vim.keymap.set('n', '<leader>ff', require('fzf-lua').files, { desc = '[F]ind [F]iles' })
    vim.keymap.set('n', '<leader>pf', require('fzf-lua').live_grep_glob, { desc = '[P]roject [F]ind' })
    vim.keymap.set('n', '<leader>fr', require('fzf-lua').resume, { desc = '[F]zf [R]esume' })
    vim.keymap.set('n', '<leader>ls', require('fzf-lua').buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>fw', require('fzf-lua').grep_cword, { desc = '[ ] Grep cword' })
    vim.keymap.set('n', '<leader>fW', require('fzf-lua').grep_cWORD, { desc = '[ ] Grep cWORD' })
    vim.keymap.set('n', '<leader>fo', require('fzf-lua').oldfiles, { desc = 'Old files' })
    vim.keymap.set('n', '<leader>rg', require('fzf-lua').grep, { desc = '[ ] Grep' })
    vim.keymap.set('v', '<leader>rg', require('fzf-lua').grep_visual, { desc = '[ ] Grep visual' })
    vim.keymap.set('n', '<leader>f/', require('fzf-lua').lines, { desc = '[ ] Grep visual' })
    vim.keymap.set('n', '<leader>/', function()
      require('fzf-lua').grep_curbuf {
        winopts = {
          height = 0.3,
          width = 0.8,
          preview = {
            hidden = 'hidden',
          },
        },
        fzf_opts = {
          ['--layout'] = 'reverse',
        },
      }
    end, { desc = 'Grep current buffer' })
    vim.keymap.set('n', '<leader>sh', require('fzf-lua').helptags, { desc = 'Help tags' })
    vim.keymap.set('n', '<leader>sk', require('fzf-lua').keymaps, { desc = 'Keymaps' })
    vim.keymap.set('n', '<leader>sn', function()
      require('fzf-lua').files { cwd = vim.fn.stdpath 'config' }
    end, { desc = 'Search Neovim files' })

    vim.keymap.set('n', '<leader>sd', require('fzf-lua').diagnostics_document, { desc = 'Document diagnostics' })
    vim.keymap.set('n', '<leader>sD', require('fzf-lua').diagnostics_workspace, { desc = 'Workspace diagnostics' })

    vim.keymap.set('n', '<leader>:', require('fzf-lua').command_history, { desc = 'Command History' })
    vim.keymap.set({ 'n', 'x' }, '<leader>ca', function()
      require('fzf-lua').lsp_code_actions {
        winopts = {
          row = 0.5,
          height = 0.65,
          width = 120,
          preview = {
            layout = 'vertical',
            vertical = 'down:65%',
            -- hidden = 'hidden',
          },
        },
        fzf_opts = {
          ['--layout'] = 'default',
        },
      }
    end, { desc = 'LSP Code Actions' })
    vim.keymap.set('n', '<leader>gs', require('fzf-lua').git_status, { desc = 'Git Status' })
    vim.keymap.set('n', '<leader>gC', require('fzf-lua').git_commits, { desc = 'Git Commits' })
    vim.keymap.set('n', '<leader>gc', require('fzf-lua').git_bcommits, { desc = 'Git Buffer Commits' })
    vim.keymap.set('n', '<leader>gB', require('fzf-lua').git_branches, { desc = 'Git Branches' })
  end,
}
