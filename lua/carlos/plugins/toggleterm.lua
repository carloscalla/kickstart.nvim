return {
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup {
        size = 30,
        direction = 'horizontal',
      }
    end,
    keys = {
      { '<leader>tt', '<Cmd>ToggleTerm<CR>', desc = 'Toggle Terminal' },
      { '<leader>tn', '<Cmd>TermNew<CR>', desc = 'New Terminal' },
    },
  },
}
