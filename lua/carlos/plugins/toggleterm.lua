return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = 30,
      direction = 'horizontal',
    }
  end,
  keys = {
    { '<leader>tt', '<Cmd>ToggleTerm<CR>' },
  },
}
