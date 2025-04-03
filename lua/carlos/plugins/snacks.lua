return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    {
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
      },
    },
    -- bigfile = { enabled = true },
    -- dashboard = { enabled = true },
    -- explorer = { enabled = true },
    -- indent = { enabled = true },
    -- input = { enabled = true },
    picker = {
      enabled = true,
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
    },
    -- notifier = { enabled = true },
    -- quickfile = { enabled = true },
    -- scope = { enabled = true },
    -- scroll = { enabled = true },
    -- statuscolumn = { enabled = true },
    -- words = { enabled = true },
  },
  keys = {
    {
      '<leader>sf',
      function()
        Snacks.picker.files()
      end,
      desc = 'Snacks files',
    },
  },
}
