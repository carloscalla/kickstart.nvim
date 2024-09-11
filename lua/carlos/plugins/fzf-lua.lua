return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- local actions = require 'fzf-lua.actions'
    -- calling `setup` is optional for customization
    require('fzf-lua').setup {
      'telescope',
      fzf_opts = { ['--layout'] = 'default' },
      keymap = {
        fzf = {
          ['ctrl-j'] = 'half-page-down',
          ['ctrl-k'] = 'half-page-up',
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
      },
      grep = {
        winopts = {
          preview = {
            layout = 'vertical',
          },
        },
      },
      -- actions = {
      --   files = {
      --     ['ctrl-q'] = actions.file_sel_to_qf,
      --     ['ctrl-l'] = actions.file_sel_to_ll,
      --   },
      -- },
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
          width = 0.3,
          preview = {
            hidden = 'hidden',
          },
        },
        fzf_opts = {
          ['--layout'] = 'reverse',
        },
      }
    end, { desc = 'Grep current buffer' })
    vim.keymap.set('n', '<leader>:', require('fzf-lua').command_history, { desc = 'Command History' })
    -- vim.keymap.set({ 'n', 'x' }, '<leader>cA', function()
    --   require('fzf-lua').lsp_code_actions {
    --     winopts = {
    --       row = 0.5,
    --       height = 15,
    --       width = 100,
    --       preview = {
    --         hidden = 'hidden',
    --       },
    --     },
    --     fzf_opts = {
    --       ['--layout'] = 'reverse',
    --     },
    --   }
    -- end, { desc = 'LSP Code Actions' })
    vim.keymap.set('n', '<leader>gC', require('fzf-lua').git_commits, { desc = 'Git Commits' })
    vim.keymap.set('n', '<leader>gc', require('fzf-lua').git_bcommits, { desc = 'Git Buffer Commits' })
    vim.keymap.set('n', '<leader>gB', require('fzf-lua').git_branches, { desc = 'Git Branches' })

    --[[
    NOTE: fzf_live is a more performant way to do live queries, can be files or grep

    For files:
    :FzF fzf_live or :lua require'fzf-lua'.fzf_live()

    For grep:
    :lua require'fzf-lua'.fzf_live("rg --column --line-number --no-heading --color=always --smart-case")
    ]]
  end,
}
