return {
  'MagicDuck/grug-far.nvim',
  cmd = { 'GrugFar', 'GrugFarWithin' },
  config = function()
    require('grug-far').setup {
      -- ... options, see Configuration section below ...
      -- ... there are no required options atm...
      -- ... engine = 'ripgrep' is default, but 'astgrep' can be specified...
    }
  end,
  keys = {
    {
      '<leader>gf',
      function()
        require('grug-far').open()
      end,
      mode = { 'n' },
      desc = 'Grug Far',
    },
    {
      '<leader>gf',
      function()
        require('grug-far').with_visual_selection()
      end,
      mode = { 'v' },
      desc = 'Grug Far selection',
    },
  },
}
