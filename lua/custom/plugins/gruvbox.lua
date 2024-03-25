return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = function()
    require('gruvbox').setup {
      overrides = {
        -- SignColumn = { bg = 'none' },
        -- WinSeparator = { fg = 'Gray', bg = 'none' },
        -- Cursor = { bg = 'DarkCyan' },
        -- Normal = { bg = 'none' },
      },
    }

    vim.o.background = 'dark' -- or "light" for light mode
    vim.cmd [[colorscheme gruvbox]]
  end,
}
