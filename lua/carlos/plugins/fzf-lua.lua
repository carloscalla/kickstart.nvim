return {
  'ibhagwan/fzf-lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'folke/snacks.nvim',
  },
  config = function()
    local function yank_and_notify(selected, opts, relative_path)
      local file = FzfLua.path.entry_to_file(selected[1], opts)
      local path_to_yank = relative_path and FzfLua.path.relative_to(file.path, vim.uv.cwd()) or file.path

      local reg
      if vim.o.clipboard == 'unnamed' then
        reg = [[*]]
      elseif vim.o.clipboard == 'unnamedplus' then
        reg = [[+]]
      else
        reg = [["]]
      end
      -- copy to the yank register regardless
      vim.fn.setreg(reg, path_to_yank)
      vim.fn.setreg([[0]], path_to_yank)
      FzfLua.utils.info(string.format("file %s copied to register %s, use 'p' to paste.", path_to_yank, reg))
    end

    local actions = require 'fzf-lua.actions'

    require('fzf-lua').setup {
      keymap = {
        builtin = {
          -- from detaults
          ['<F1>'] = 'toggle-help',
          ['<F2>'] = 'toggle-fullscreen',
          -- Only valid with the 'builtin' previewer
          ['<F3>'] = 'toggle-preview-wrap',
          ['<F4>'] = 'toggle-preview',
          ['<F5>'] = 'toggle-preview-ccw',
          ['<F6>'] = 'toggle-preview-cw',
          ['<F7>'] = 'toggle-preview-ts-ctx',
          ['<F8>'] = 'preview-ts-ctx-dec',
          ['<F9>'] = 'preview-ts-ctx-inc',
          ['<S-Left>'] = 'preview-reset',
          ['<S-down>'] = 'preview-down',
          ['<S-up>'] = 'preview-up',

          -- custom
          ['<C-o>'] = 'toggle-preview',
          ['<C-/>'] = 'toggle-help',
          ['<C-d>'] = 'preview-page-down',
          ['<C-u>'] = 'preview-page-up',
        },
        fzf = {
          -- from defaults
          ['ctrl-z'] = 'abort',
          ['ctrl-a'] = 'beginning-of-line',
          ['ctrl-e'] = 'end-of-line',
          ['alt-a'] = 'toggle-all',
          ['alt-g'] = 'first',
          ['alt-G'] = 'last',
          -- Only valid with fzf previewers (bat/cat/git/etc)
          ['f3'] = 'toggle-preview-wrap',
          ['f4'] = 'toggle-preview',
          ['shift-down'] = 'preview-down',
          ['shift-up'] = 'preview-up',

          -- custom
          ['ctrl-j'] = 'half-page-down',
          ['ctrl-k'] = 'half-page-up',
          ['ctrl-d'] = 'preview-page-down',
          ['ctrl-u'] = 'preview-page-up',
          ['ctrl-q'] = 'select-all+accept',
          ['ctrl-l'] = 'unix-line-discard',
        },
      },
      actions = {
        files = {
          -- from defaults
          ['enter'] = actions.file_edit_or_qf,
          ['ctrl-s'] = actions.file_split,
          ['ctrl-v'] = actions.file_vsplit,
          ['ctrl-t'] = actions.file_tabedit,
          ['alt-q'] = actions.file_sel_to_qf,
          ['alt-f'] = { fn = actions.toggle_follow, reuse = true, header = false },

          -- custom
          ['alt-l'] = actions.file_sel_to_ll,
          ['alt-h'] = actions.toggle_hidden,
          ['alt-i'] = actions.toggle_ignore,
          -- ctrl-i can't be used because it conflicts with TAB
          -- For more information see:
          -- https://unix.stackexchange.com/questions/563469/conflict-ctrl-i-with-tab-in-normal-mode

          ['ctrl-y'] = {
            fn = function(selected, opts)
              if not selected[1] then
                return
              end
              yank_and_notify(selected, opts, true)
            end,
            exec_silent = true,
            desc = 'yank-relative-path',
          },
          ['alt-y'] = {
            fn = function(selected, opts)
              if not selected[1] then
                return
              end
              yank_and_notify(selected, opts, false)
            end,
            exec_silent = true,
            desc = 'yank-absolute-path',
          },
        },
      },
      -- Default winopts for all pickers.
      -- Options set in each picker will merge and override these defaults.
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
      blines = {
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
          extensions = {
            ['svg'] = { 'chafa', '--format=symbols', '{file}' },
            ['gif'] = { 'viu', '-b' },
          },
        },
        codeaction = { toggle_behavior = 'extend' },
      },
      grep = {
        winopts = {
          height = 0.87,
          width = 0.75,
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
      quickfix = {
        winopts = {
          preview = {
            layout = 'vertical',
            vertical = 'up:60%',
          },
        },
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
    vim.keymap.set('n', '<leader>/', require('fzf-lua').blines, { desc = 'Buffer lines' })
    vim.keymap.set('n', '<leader>sh', require('fzf-lua').helptags, { desc = 'Help tags' })
    vim.keymap.set('n', '<leader>sk', require('fzf-lua').keymaps, { desc = 'Keymaps' })
    vim.keymap.set('n', '<leader>sn', function()
      require('fzf-lua').files { cwd = vim.fn.stdpath 'config' }
    end, { desc = 'Search Neovim files' })

    vim.keymap.set('n', '<leader>fd', require('fzf-lua').diagnostics_document, { desc = 'Document diagnostics' })
    vim.keymap.set('n', '<leader>fD', require('fzf-lua').diagnostics_workspace, { desc = 'Workspace diagnostics' })

    vim.keymap.set('n', '<leader>:', require('fzf-lua').command_history, { desc = 'Command History' })
    vim.keymap.set({ 'n', 'x' }, '<leader>ca', function()
      require('fzf-lua').lsp_code_actions {
        winopts = {
          height = 0.65,
          width = 120,
          preview = {
            layout = 'vertical',
            vertical = 'down:65%',
            -- hidden = 'hidden',
          },
        },
      }
    end, { desc = 'LSP Code Actions' })
    vim.keymap.set('n', '<leader>gs', require('fzf-lua').git_status, { desc = 'Git Status' })
    vim.keymap.set('n', '<leader>gC', require('fzf-lua').git_commits, { desc = 'Git Commits' })
    vim.keymap.set('n', '<leader>gc', require('fzf-lua').git_bcommits, { desc = 'Git Buffer Commits' })
    vim.keymap.set('n', '<leader>gB', require('fzf-lua').git_branches, { desc = 'Git Branches' })
  end,
}
