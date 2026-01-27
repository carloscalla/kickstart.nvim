return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    image = {
      enabled = true,
      -- define these here, so that we don't need to load the image module
      formats = {
        'png',
        'jpg',
        'jpeg',
        'gif',
        'bmp',
        'webp',
        'tiff',
        'heic',
        'avif',
        'mp4',
        'mov',
        'avi',
        'mkv',
        'webm',
        'pdf',
        'icns',
        'svg',
      },
      doc = {
        enabled = false,
      },
    },
    explorer = {
      enabled = true,
      replace_netrw = false,
    },
    picker = {
      enabled = true,
      ui_select = true,
      layout = {
        cycle = false,
      },
      win = {
        input = {
          keys = {
            -- Use to close the picker with Esc instead of going to normal mode
            -- ['<Esc>'] = { 'close', mode = { 'n', 'i' } },
            ['<c-d>'] = { 'preview_scroll_down', mode = { 'i', 'n' } },
            ['<c-u>'] = { 'preview_scroll_up', mode = { 'i', 'n' } },
            ['<c-j>'] = { 'list_scroll_down', mode = { 'i', 'n' } },
            ['<c-k>'] = { 'list_scroll_up', mode = { 'i', 'n' } },
          },
        },
      },
      formatters = {
        file = {
          truncate = 999,
        },
      },
      sources = {
        explorer = {
          auto_close = true,
          win = {
            input = {
              keys = {
                ['<Esc>'] = 'cancel',
              },
            },
          },
          layout = {
            layout = {
              box = 'horizontal',
              width = 0.5,
              min_width = 60,
              height = 0.8,
              {
                box = 'vertical',
                border = 'rounded',
                title = '{title} {live} {flags}',
                {
                  win = 'input',
                  height = 1,
                  border = 'bottom',
                },
                { win = 'list', border = 'none' },
              },
              {
                win = 'preview',
                title = '{preview}',
                border = 'rounded',
                width = 0.5,
              },
            },
          },
        },
        -- files = {
        --   layout = {
        --     preset = 'ivy_split',
        --     layout = {
        --       height = 20,
        --     },
        --   },
        -- },
        gh_diff = {
          layout = {
            preset = 'ivy_split',
            layout = {
              height = 13,
            },
          },
          win = {
            input = {
              keys = {
                ['<Esc>'] = 'cancel',
              },
            },
          },
        },
      },
    },
    gitbrowse = {},
    indent = {
      enabled = false, -- start disabled and toggle with a keybinding
      animate = {
        enabled = false,
      },
    },
    input = {
      enabled = true,
      win = {
        position = 'float',
        row = 0.45,
      },
    },
    gh = {
      keys = {
        diff = { '<leader>gd', 'gh_diff', desc = 'View diff for current PR' },
      },
    },
  },
  keys = {
    {
      '<leader>nt',
      function()
        Snacks.explorer.open { follow_file = false }
      end,
      desc = 'Snacks explorer',
    },
    {
      '<leader>fi',
      function()
        Snacks.explorer.open { follow_file = true }
      end,
      desc = 'Snacks explorer',
    },
    {
      '<leader>ti',
      function()
        if Snacks.indent.enabled then
          Snacks.indent.disable()
        else
          Snacks.indent.enable()
        end
      end,
      desc = 'Toggle Snacks indent',
    },
    {
      '<leader>sf',
      function()
        Snacks.picker.files()
      end,
      desc = 'Snacks files',
    },
    {
      '<leader>si',
      function()
        Snacks.image.hover()
      end,
      desc = 'Snacks image (float)',
    },
    {
      '<leader>su',
      function()
        Snacks.picker.undo()
      end,
      desc = 'Snacks undo',
    },
    {
      '<leader>ghr',
      function()
        Snacks.picker.gh_pr { search = 'is:open review-requested:@me ' }
      end,
      desc = 'GitHub PR review requested to me or my team',
    },
    {
      '<leader>ghR',
      function()
        Snacks.picker.gh_pr { search = 'is:open user-review-requested:@me ' }
      end,
      desc = 'GitHub PR review requested to me',
    },
    {
      '<leader>ghi',
      function()
        Snacks.picker.gh_pr { search = 'is:open involves:@me ' }
      end,
      desc = 'GitHub PR involving me',
    },
  },
}
