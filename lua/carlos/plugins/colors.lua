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
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePost', 'VeryLazy' },
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
    enabled = false,
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
    enabled = true,
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

        -- colors.bg = '#1a1b26'
        -- colors.bg_dark = '#16161e'
        -- colors.bg_dark1 = '#0C0E14'
        -- colors.bg_float = '#16161e'
        -- colors.bg_highlight = '#292e42'
        -- colors.bg_popup = '#16161e'
        -- colors.bg_search = '#3d59a1'
        -- colors.bg_sidebar = '#16161e'
        -- colors.bg_statusline = '#16161e'

        -- colors.bg_visual = '#283457'
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
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    enabled = false,
    priority = 1000,
    opts = {
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = 'latte',
        dark = 'mocha',
      },
      transparent_background = true, -- disables setting the background color.
      float = {
        transparent = false, -- enable transparent floating windows
        solid = false, -- use solid styling for floating windows, see |winborder|
      },
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = 'dark',
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = true, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { 'italic' }, -- Change the style of comments
        conditionals = { 'italic' },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
      },
      lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
        virtual_text = {
          errors = { 'italic' },
          hints = { 'italic' },
          warnings = { 'italic' },
          information = { 'italic' },
          ok = { 'italic' },
        },
        underlines = {
          errors = { 'underline' },
          hints = { 'underline' },
          warnings = { 'underline' },
          information = { 'underline' },
          ok = { 'underline' },
        },
        inlay_hints = {
          background = true,
        },
      },
      color_overrides = {},
      custom_highlights = {},
      default_integrations = true,
      auto_integrations = false,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = '',
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)

      vim.cmd.colorscheme 'catppuccin'
    end,
  },
  {
    'EdenEast/nightfox.nvim',
    enabled = false,
    opts = {
      options = {
        transparent = true, -- Disable setting background
        terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        dim_inactive = false, -- Non focused panes set to alternative background
        module_default = true, -- Default enable value for modules
        styles = { -- Style to be applied to different syntax groups
          comments = 'NONE', -- Value is any valid attr-list value `:help attr-list`
          conditionals = 'NONE',
          constants = 'NONE',
          functions = 'NONE',
          keywords = 'NONE',
          numbers = 'NONE',
          operators = 'NONE',
          strings = 'NONE',
          types = 'NONE',
          variables = 'NONE',
        },
        inverse = { -- Inverse highlight for different types
          match_paren = false,
          visual = false,
          search = false,
        },
        modules = { -- List of various plugins and additional options
          -- ...
        },
      },
      palettes = {},
      specs = {},
      groups = {},
    },
    config = function(_, opts)
      -- Default options
      require('nightfox').setup(opts)

      -- setup must be called before loading
      vim.cmd 'colorscheme nightfox'
    end,
  },
}
