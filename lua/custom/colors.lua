function ColorGruvBox()
  vim.g.gruvbox_contrast_dark = 'hard'
  vim.g.gruvbox_italic = '1'
  vim.g.gruvbox_bold = '1'
  vim.g.gruvbox_invert_selection = '0'
  vim.opt.background = 'dark'

  vim.cmd('colorscheme ' .. vim.g.carlos_colorscheme)

  local hl = function(thing, opts)
    vim.api.nvim_set_hl(0, thing, opts)
  end

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

-- ColorGruvBox()

function ColorHighlights()
  local hl = function(thing, opts)
    vim.api.nvim_set_hl(0, thing, opts)
  end

  hl('SignColumn', {
    bg = 'none',
  })

  hl('WinSeparator', {
    fg = 'Gray',
  })

  hl('Cursor', {
    bg = 'DarkCyan',
    fg = 'Yellow',
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

ColorHighlights()
