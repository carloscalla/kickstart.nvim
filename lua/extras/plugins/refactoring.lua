return {
  'ThePrimeagen/refactoring.nvim',
  -- Uses:
  -- 'nvim-lua/plenary.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  cmd = 'Refactor',
  config = function()
    require('refactoring').setup()
  end,
}
