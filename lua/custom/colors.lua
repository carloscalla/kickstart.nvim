function ColorGruvBox()
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

function ColorRosePine()
  local hl = function(thing, opts)
    vim.api.nvim_set_hl(0, thing, opts)
  end

  hl('Cursor', {
    bg = 'DarkCyan',
    fg = 'Yellow',
  })

  hl('Normal', {
    bg = 'none',
  })

  hl('NormalNC', {
    bg = 'none',
  })

  hl('NormalFloat', {
    bg = 'none',
  })

  hl('TreesitterContext', {
    bg = '#333333',
  })

  hl('TreesitterContextLineNumber', {
    fg = '#f5b942',
  })
end

ColorRosePine()
