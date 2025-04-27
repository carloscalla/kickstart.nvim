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
      { '<leader>tt', '<Cmd>ToggleTerm<CR>' },
      { '<leader>tn', '<Cmd>TermNew<CR>' },
    },
  },
}
