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
      win = {
        input = {
          keys = {
            ['<Esc>'] = { 'close', mode = { 'n', 'i' } },
            ['<c-d>'] = { 'preview_scroll_down', mode = { 'i', 'n' } },
            ['<c-u>'] = { 'preview_scroll_up', mode = { 'i', 'n' } },
            ['<c-j>'] = { 'list_scroll_down', mode = { 'i', 'n' } },
            ['<c-k>'] = { 'list_scroll_up', mode = { 'i', 'n' } },
          },
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
        files = {
          layout = {
            preset = 'ivy_split',
          },
        },
      },
    },
    gitbrowse = {},
    indent = {
      enabled = false,
      animate = {
        enabled = false,
      },
    },
  },
  keys = {
    --   {
    --     '<leader>sf',
    --     function()
    --       Snacks.picker.files()
    --     end,
    --     desc = 'Snacks files',
    --   },
    --   {
    --     '<leader>nt',
    --     function()
    --       Snacks.explorer.open { follow_file = false }
    --     end,
    --     desc = 'Snacks explorer',
    --   },
    --   {
    --     '<leader>fi',
    --     function()
    --       Snacks.explorer.open { follow_file = true }
    --     end,
    --     desc = 'Snacks explorer',
    --   },
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
      '<leader>/',
      function()
        Snacks.picker.lines()
      end,
      desc = 'Buffer lines',
    },
  },
}
