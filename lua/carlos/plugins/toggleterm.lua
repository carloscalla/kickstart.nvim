return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = 30,
      direction = 'horizontal',
    }
  end,
}
