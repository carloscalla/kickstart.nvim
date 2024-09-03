return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  cmd = 'Refactor',
  config = function()
    require('refactoring').setup()
  end,
}
