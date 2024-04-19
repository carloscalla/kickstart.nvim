return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = function()
    require('gruvbox').setup {
      terminal_colors = true,
      bold = false,
      italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
      },
      overrides = {
        -- SignColumn = { bg = 'none' },
        -- WinSeparator = { fg = 'Gray', bg = 'none' },
        -- Cursor = { bg = 'DarkCyan' },
        -- Normal = { bg = 'none' },
      },
      -- transparent_mode = true,
    }

    vim.o.background = 'dark' -- or "light" for light mode
    vim.cmd [[colorscheme gruvbox]]

    -- You can configure highlights by doing something like:
    -- vim.cmd.hi 'Comment gui=none'
  end,
}
