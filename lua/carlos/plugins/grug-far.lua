return {
  'MagicDuck/grug-far.nvim',
  enabled = false,
  config = function()
    require('grug-far').setup {
      -- ... options, see Configuration section below ...
      -- ... there are no required options atm...
      -- ... engine = 'ripgrep' is default, but 'astgrep' can be specified...
    }
  end,
}
