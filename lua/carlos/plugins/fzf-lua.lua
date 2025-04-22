return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local actions = require 'fzf-lua.actions'
    -- calling `setup` is optional for customization
    require('fzf-lua').setup {
      -- 'telescope',
      fzf_opts = { ['--layout'] = 'default' },
      keymap = {
        fzf = {
          true,
          ['ctrl-j'] = 'half-page-down',
          ['ctrl-k'] = 'half-page-up',
          ['ctrl-d'] = 'preview-page-down',
          ['ctrl-u'] = 'preview-page-up',
          ['alt-q'] = 'select-all+accept',
        },
        builtin = {
          true,
          ['<C-o>'] = 'toggle-preview',
          ['<C-/>'] = 'toggle-help',
          ['<C-d>'] = 'preview-page-down',
          ['<C-u>'] = 'preview-page-up',
        },
      },
      winopts = {
        preview = {
          horizontal = 'right:50%',
          layout = 'flex',
        },
      },
      previewers = {
        builtin = {
          extensions = {
            -- ['png'] = { 'chafa', '{file}' },
            -- ['svg'] = { 'chafa', '{file}' },
            -- ['jpg'] = { 'chafa', '{file}' },
            -- ['gif'] = { 'chafa', '{file}' },

            ['png'] = { 'viu', '-b' },
            ['svg'] = { 'viu', '-b' },
            ['jpg'] = { 'viu', '-b' },
            ['gif'] = { 'viu', '-b' },
          },
        },
        codeaction = { toggle_behavior = 'extend' },
      },
      grep = {
        winopts = {
          preview = {
            layout = 'vertical',
          },
        },
      },
      actions = {
        files = {
          ['enter'] = actions.file_edit_or_qf,
          ['ctrl-q'] = actions.file_sel_to_qf,
          -- ['ctrl-l'] = actions.file_sel_to_ll,
        },
      },
      -- oldfiles = {
      --   include_current_session = true,
      --   cwd_only = true,
      -- },
    }

    vim.keymap.set('n', '<leader>ff', require('fzf-lua').files, { desc = '[F]ind [F]iles' })
    vim.keymap.set('n', '<leader>pf', require('fzf-lua').live_grep_glob, { desc = '[P]roject [F]ind' })
    vim.keymap.set('n', '<leader>fr', require('fzf-lua').resume, { desc = '[F]zf [R]esume' })
    vim.keymap.set('n', '<leader>ls', require('fzf-lua').buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>fw', require('fzf-lua').grep_cword, { desc = '[ ] Grep cword' })
    vim.keymap.set('n', '<leader>fW', require('fzf-lua').grep_cWORD, { desc = '[ ] Grep cWORD' })
    vim.keymap.set('n', '<leader>fo', function()
      require('fzf-lua').oldfiles {
        cwd_only = true,
        include_current_session = true,
      }
    end, { desc = '[ ] Old files' })
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
    vim.keymap.set('n', '<leader>sd', require('fzf-lua').diagnostics_document, { desc = 'Document diagnostics' })
    vim.keymap.set('n', '<leader>sD', require('fzf-lua').diagnostics_workspace, { desc = 'Workspace diagnostics' })

    vim.keymap.set('n', '<leader>:', require('fzf-lua').command_history, { desc = 'Command History' })
    vim.keymap.set({ 'n', 'x' }, '<leader>ca', function()
      require('fzf-lua').lsp_code_actions {
        winopts = {
          row = 0.5,
          -- height = 15,
          -- width = 100,
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
