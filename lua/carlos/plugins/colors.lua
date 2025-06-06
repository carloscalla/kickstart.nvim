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
        terminal_colors = true,
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          functions = { italic = false },
          variables = { italic = false },
        },
      }

      vim.cmd [[colorscheme solarized-osaka]]

      hl('TreesitterContextLineNumber', {
        fg = '#f5b942',
      })

      hl('MsgArea', {
        fg = '#9fabad',
      })

      hl('FzfLuaBorder', {
        fg = '#18687a',
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
      style = 'moon', -- 'storm', 'night', 'day', 'moon'
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
      on_colors = function(colors)
        -- setting bg colors from night style
        -- remove if you prefer the default colors
        colors.bg = '#1a1b26'
        colors.bg_dark = '#16161e'
        colors.bg_dark1 = '#0C0E14'
        colors.bg_float = '#16161e'
        colors.bg_highlight = '#292e42'
        colors.bg_popup = '#16161e'
        colors.bg_search = '#3d59a1'
        colors.bg_sidebar = '#16161e'
        colors.bg_statusline = '#16161e'
        colors.bg_visual = '#283457'
      end,
      on_highlights = function(_hl, c)
        _hl.WinSeparator = {
          fg = c.bg_highlight,
        }
      end,
    },
    config = function(_, opts)
      require('tokyonight').setup(opts)
      vim.cmd [[colorscheme tokyonight]]
    end,
  },
}
