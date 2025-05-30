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

    local winopts_ivy = {
      -- row = 1,
      -- col = 0,
      -- width = 1,
      -- height = 0.45,
      row = vim.o.lines - vim.o.cmdheight - 30 - 3,
      col = 0.53,
      width = 230,
      height = 30,
      preview = {
        hidden = true,
      },
    }

    require('fzf-lua').setup {
      fzf_opts = { ['--cycle'] = true },
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
        border = 'single',
        title_pos = 'left',
        preview = {
          horizontal = 'right:55%',
          layout = 'flex',
          border = 'single',
        },
      },
      files = {
        winopts = winopts_ivy,
      },
      lines = {
        winopts = {
          -- width = 0.75,
          width = 170,
          preview = {
            layout = 'vertical',
            vertical = 'up:60%',
          },
        },
      },
      blines = {
        winopts = {
          -- width = 0.75,
          width = 170,
          preview = {
            layout = 'vertical',
            vertical = 'up:60%',
          },
        },
      },
      previewers = {
        builtin = {
          title_fnamemodify = function(s)
            local relative_path = vim.fn.fnamemodify(s, ':~:.')
            return vim.fn.pathshorten(relative_path, 3)
          end,
          snacks_image = { enabled = true, render_inline = false },
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
          -- width = 0.75,
          width = 170,
          preview = {
            layout = 'vertical',
            vertical = 'up:60%',
          },
        },
      },
      lsp = {
        winopts = {
          width = 170,
        },
        code_actions = {
          previewer = 'codeaction',
        },
      },
      buffers = {
        winopts = vim.tbl_deep_extend('force', {}, winopts_ivy, {
          preview = {
            hidden = false,
          },
        }),
      },
      oldfiles = {
        winopts = winopts_ivy,
        include_current_session = true,
        cwd_only = true,
      },
      quickfix = {
        winopts = {
          width = 170,
          preview = {
            layout = 'vertical',
            vertical = 'up:60%',
          },
        },
      },
    }

    vim.keymap.set('n', '<leader>ff', require('fzf-lua').files, { desc = '[f]ind [f]iles' })
    vim.keymap.set('n', '<leader>pf', require('fzf-lua').live_grep_glob, { desc = '[p]roject [f]ind' })
    vim.keymap.set('n', '<leader>fr', require('fzf-lua').resume, { desc = '[f]zflua [r]esume' })
    vim.keymap.set('n', '<leader>ls', require('fzf-lua').buffers, { desc = 'List open buffers' })
    vim.keymap.set('n', '<leader>fw', require('fzf-lua').grep_cword, { desc = 'Grep cword' })
    vim.keymap.set('n', '<leader>fW', require('fzf-lua').grep_cWORD, { desc = 'Grep cWORD' })
    vim.keymap.set('n', '<leader>fo', require('fzf-lua').oldfiles, { desc = 'Old files' })
    vim.keymap.set('n', '<leader>rg', require('fzf-lua').grep, { desc = 'Grep' })
    vim.keymap.set('v', '<leader>rg', require('fzf-lua').grep_visual, { desc = 'Grep visual' })
    vim.keymap.set('n', '<leader>f/', require('fzf-lua').lines, { desc = 'Lines (Open buffers)' })
    vim.keymap.set('n', '<leader>/', require('fzf-lua').blines, { desc = 'Buffer lines' })
    vim.keymap.set('n', '<leader>fq', require('fzf-lua').quickfix_stack, { desc = 'Quickfix stack' })
    vim.keymap.set('n', '<leader>sh', require('fzf-lua').helptags, { desc = 'Search help tags' })
    vim.keymap.set('n', '<leader>sk', require('fzf-lua').keymaps, { desc = 'Search keymaps' })
    vim.keymap.set('n', '<leader>sn', function()
      require('fzf-lua').files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[s]earch [n]eovim files' })

    vim.keymap.set('n', '<leader>fd', require('fzf-lua').diagnostics_document, { desc = 'Document diagnostics' })
    vim.keymap.set('n', '<leader>fD', require('fzf-lua').diagnostics_workspace, { desc = 'Workspace diagnostics' })

    vim.keymap.set('n', '<leader>:', require('fzf-lua').command_history, { desc = 'Command History' })
    vim.keymap.set('n', '<leader>gs', require('fzf-lua').git_status, { desc = 'Git Status' })
    vim.keymap.set('n', '<leader>gC', require('fzf-lua').git_commits, { desc = 'Git Commits' })
    vim.keymap.set('n', '<leader>gc', require('fzf-lua').git_bcommits, { desc = 'Git Buffer Commits' })
    vim.keymap.set('n', '<leader>gB', require('fzf-lua').git_branches, { desc = 'Git Branches' })

    vim.keymap.set('n', '<leader>fh', function()
      local harpoon = require 'harpoon'
      local fzf = require 'fzf-lua'
      local list = harpoon:list()
      local items = {}
      for i = 1, list:length() do
        local item = list:get(i)
        if item and item.value and item.value ~= '' then
          table.insert(items, string.format('%d: %s', i, item.value)) -- skip empty lines if deletion didn't work properly
        end
      end
      fzf.fzf_exec(items, {
        prompt = 'Harpoon Files> ',
        winopts = {
          width = 1,
          height = 15,
          row = 1,
          col = 0,
        },
        actions = {
          ['default'] = function(selected)
            local idx = tonumber(selected[1]:match '^(%d+):')
            if idx then
              list:select(idx)
            end
          end,
          ['ctrl-d'] = function(selected)
            local idx = tonumber(selected[1]:match '^(%d+):')
            if idx then
              local item = list:get(idx)
              list:remove(item)
            end
          end,
        },
      })
    end, { desc = 'FzfLua Harpoon' })
  end,
}
