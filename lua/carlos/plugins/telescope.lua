return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    { 'xiyaowong/telescope-emoji.nvim' }, -- Emojis
  },
  config = function()
    local actions = require 'telescope.actions'
    local open_with_trouble = require('trouble.sources.telescope').open

    require('telescope').setup {
      defaults = {
        preview = { filesize_limit = 10 },
        path_display = { truncate = 1 },
        layout_config = {
          vertical = {
            width = 0.7,
          },
        },
        mappings = {
          i = {
            ['<c-t>'] = open_with_trouble,
            ['<c-g>'] = 'to_fuzzy_refine',
            ['<c-s>'] = actions.send_selected_to_qflist + actions.open_qflist,
          },
          n = {
            ['<c-t>'] = open_with_trouble,
            ['<c-s>'] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      pickers = {
        live_grep = {
          layout_strategy = 'vertical',
        },
        lsp_definitions = {
          layout_strategy = 'vertical',
          layout_config = {
            preview_height = 0.65,
          },
          fname_width = 0.6,
        },
        lsp_references = {
          layout_strategy = 'vertical',
          fname_width = 0.7,
          show_line = true,
          trim_text = false,
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension 'emoji')

    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })
  end,
}
