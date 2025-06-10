return {
  'ibhagwan/fzf-lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'folke/snacks.nvim',
    'roginfarrer/fzf-lua-lazy.nvim',
    'nvim-lua/plenary.nvim',
  },
  cmd = { 'FzfLua', 'PluginsReadme' },
  config = function()
    vim.api.nvim_create_user_command('PluginsReadme', function()
      require('fzf-lua-lazy').search()
    end, { desc = 'Search plugins READMEs' })

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

    local winopts_files = {
      -- ivy
      -- row = 1,
      -- col = 0,
      -- width = 1,
      -- height = 0.45,

      -- ivy showing status line
      -- row = vim.o.lines - vim.o.cmdheight - 30 - 3,
      -- col = 0.53,
      -- width = 230,
      -- height = 30,

      width = 180,
      height = 40,

      preview = {
        hidden = true,
      },
    }

    require('fzf-lua').setup {
      -- fzf_opts = { ['--cycle'] = true },
      fzf_colors = {
        ['hl+'] = { 'fg', 'FzfLuaFzfMatch' },
        ['hl'] = { 'fg', 'FzfLuaFzfMatch' },
      },
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
        winopts = winopts_files,
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
        winopts = vim.tbl_deep_extend('force', {}, winopts_files, {
          preview = {
            hidden = false,
          },
        }),
      },
      oldfiles = {
        winopts = winopts_files,
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
  end,
  keys = {
    {
      '<leader>f?',
      function()
        require('fzf-lua').builtin()
      end,
      desc = 'fzf-lua builtin',
    },
    {
      '<leader>ff',
      function()
        require('fzf-lua').files()
      end,
      desc = '[f]ind [f]iles',
    },
    {
      '<leader>fF',
      function()
        local Path = require 'plenary.path'
        local current_file_path = Path:new(vim.fn.expand '%:p')
        local nearest_package_json = current_file_path:find_upwards 'package.json'

        if nearest_package_json and nearest_package_json:exists() then
          require('fzf-lua').files { cwd = vim.fn.fnamemodify(nearest_package_json:absolute(), ':h:p') }
        else
          vim.notify(string.format "[Fzf-lua]: Can't find a parent package.json", vim.log.levels.ERROR, { title = 'Fzf-lua custom' })
        end
      end,
      desc = '[f]ind [F]iles in nearest package.json dir', -- useful when working with monorepos
    },
    {
      '<leader>pf',
      function()
        require('fzf-lua').live_grep_glob()
      end,
      desc = '[p]roject [f]ind',
    },
    {
      '<leader>fr',
      function()
        require('fzf-lua').resume()
      end,
      desc = '[f]zflua [r]esume',
    },
    {
      '<leader>ls',
      function()
        require('fzf-lua').buffers()
      end,
      desc = 'List open buffers',
    },
    {
      '<leader>fw',
      function()
        require('fzf-lua').grep_cword()
      end,
      desc = 'Grep cword',
    },
    {
      '<leader>fW',
      function()
        require('fzf-lua').grep_cWORD()
      end,
      desc = 'Grep cWORD',
    },
    {
      '<leader>fo',
      function()
        require('fzf-lua').oldfiles()
      end,
      desc = 'Old files',
    },
    {
      '<leader>rg',
      function()
        require('fzf-lua').grep()
      end,
      desc = 'Grep',
    },
    {
      '<leader>rg',
      function()
        require('fzf-lua').grep_visual()
      end,
      mode = 'v',
      desc = 'Grep visual',
    },
    {
      '<leader>f/',
      function()
        require('fzf-lua').lines()
      end,
      desc = 'Lines (Open buffers)',
    },
    {
      '<leader>/',
      function()
        require('fzf-lua').blines()
      end,
      desc = 'Buffer lines',
    },
    {
      '<leader>fq',
      function()
        require('fzf-lua').quickfix_stack()
      end,
      desc = 'Quickfix stack',
    },
    {
      '<leader>sh',
      function()
        require('fzf-lua').helptags()
      end,
      desc = 'Search help tags',
    },
    {
      '<leader>sk',
      function()
        require('fzf-lua').keymaps()
      end,
      desc = 'Search keymaps',
    },
    {
      '<leader>sn',
      function()
        require('fzf-lua').files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = '[s]earch [n]eovim files',
    },
    {
      '<leader>fd',
      function()
        require('fzf-lua').diagnostics_document()
      end,
      desc = 'Document diagnostics',
    },
    {
      '<leader>fD',
      function()
        require('fzf-lua').diagnostics_workspace()
      end,
      desc = 'Workspace diagnostics',
    },

    {
      '<leader>:',
      function()
        require('fzf-lua').command_history()
      end,
      desc = 'Command History',
    },
    {
      '<leader>gs',
      function()
        require('fzf-lua').git_status()
      end,
      desc = 'Git Status',
    },
    {
      '<leader>gC',
      function()
        require('fzf-lua').git_commits()
      end,
      desc = 'Git Commits',
    },
    {
      '<leader>gc',
      function()
        require('fzf-lua').git_bcommits()
      end,
      desc = 'Git Buffer Commits',
    },
    {
      '<leader>gB',
      function()
        require('fzf-lua').git_branches()
      end,
      desc = 'Git Branches',
    },
    {
      '<leader>fh',
      function()
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
            height = 15,
            width = 0.8,
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
      end,
      desc = 'FzfLua Harpoon',
    },
  },
}
