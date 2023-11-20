function ColorGruvBox()
  vim.g.gruvbox_contrast_dark = 'hard'
  vim.g.gruvbox_italic = '1'
  vim.g.gruvbox_bold = '1'
  vim.g.gruvbox_invert_selection = '0'
  vim.opt.background = "dark"

  vim.cmd("colorscheme " .. vim.g.carlos_colorscheme)

  local hl = function(thing, opts)
    vim.api.nvim_set_hl(0, thing, opts)
  end

  hl("SignColumn", {
    bg = "none",
  })

  -- hl("ColorColumn", {
  --     ctermbg = 0,
  --     bg = "#555555",
  -- })

  -- hl("CursorLineNR", {
  --   bg = "None"
  -- })

  hl('WinSeparator', {
    fg = 'Gray'
  })

  hl('Cursor', {
    bg = 'DarkCyan',
    fg = 'White'
  })

  hl("Normal", {
    bg = "none"
  })

  -- hl("LineNr", {
  --     fg = "#5eacd3"
  -- })

  -- hl("netrwDir", {
  --     fg = "#5eacd3"
  -- })
end

ColorGruvBox()
