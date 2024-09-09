return {
  'yioneko/nvim-vtsls',
  enabled = false,
  -- lazy = true,
  opts = {},
  config = function(_, opts)
    require('vtsls').config(opts)
  end,
}
