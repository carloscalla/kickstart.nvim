return {
  'rose-pine/neovim',
  name = 'rose-pine',
  config = function()
    require('rose-pine').setup {
      disable_background = true,
      extend_background_behind_borders = false,
    }

    vim.cmd 'colorscheme rose-pine-moon'
  end,
}
