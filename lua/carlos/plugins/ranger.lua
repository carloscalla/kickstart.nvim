return {
  'kelly-lin/ranger.nvim',
  cmd = 'Ranger',
  opts = {},
  init = function()
    vim.api.nvim_create_user_command('Ranger', function()
      require('ranger-nvim').open(true)
    end, { desc = 'Open ranger' })
  end,
}
