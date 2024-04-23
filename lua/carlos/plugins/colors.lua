return {
  {
    'ellisonleao/gruvbox.nvim',
    enabled = false,
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
  },
  {
    'rose-pine/neovim',
    enabled = false,
    name = 'rose-pine',
    priority = 1000,
    config = function()
      require('rose-pine').setup {
        disable_background = true,
        extend_background_behind_borders = false,
      }

      vim.cmd 'colorscheme rose-pine'
    end,
  },
  {
    'craftzdog/solarized-osaka.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('solarized-osaka').setup {
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
        },
      }

      vim.cmd [[colorscheme solarized-osaka]]
    end,
  },
}
