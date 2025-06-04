return {
  'stevearc/overseer.nvim',
  cmd = { 'OverseerRun' },
  opts = {},
  keys = {
    {
      '<leader>or',
      function()
        require('overseer').run_template()
      end,
      desc = 'Overseer: Open',
    },
  },
}
