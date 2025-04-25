local hl = function(thing, opts)
  vim.api.nvim_set_hl(0, thing, opts)
end

function ColorGruvBox()
  hl('SignColumn', {
    bg = 'none',
  })

  hl('WinSeparator', {
    fg = 'Gray',
  })

  hl('Cursor', {
    bg = 'DarkCyan',
    fg = 'White',
  })

  hl('Normal', {
    bg = 'none',
  })

  hl('TreesitterContext', {
    bg = '#333333',
  })

  hl('TreesitterContextLineNumber', {
    fg = '#f5b942',
  })
end

function ColorRosePine()
  hl('Cursor', {
    bg = 'DarkCyan',
    fg = 'White',
  })

  hl('Normal', {
    bg = 'none',
  })

  hl('NormalNC', {
    bg = 'none',
  })
end

return {
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
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

      ColorGruvBox()
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

      ColorRosePine()
    end,
  },
  {
    'craftzdog/solarized-osaka.nvim',
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      require('solarized-osaka').setup {
        transparent = true,
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          functions = { italic = false },
          variables = { italic = false },
        },
        on_colors = function(colors) end,
        on_highlights = function(highlights, colors) end,
      }

      vim.cmd [[colorscheme solarized-osaka]]

      hl('TreesitterContextLineNumber', {
        fg = '#f5b942',
      })

      hl('MsgArea', {
        fg = '#9fabad',
      })

      vim.cmd [[ hi Visual cterm=NONE gui=NONE ]]
    end,
  },
  {
    'folke/tokyonight.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = {
      style = 'night',
      transparent = true,
      terminal_colo = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
    },
    init = function()
      vim.cmd [[colorscheme tokyonight]]
    end,
  },
}
