return {
  'vuciv/vim-bujo',
  cmd = { 'TodoApp', 'TodoAppGlobal' },
  init = function()
    vim.api.nvim_create_user_command('TodoApp', function()
      vim.cmd [[ botright split Todo]]
    end, { desc = 'Open Bujo' })

    vim.api.nvim_create_user_command('TodoAppGlobal', function()
      vim.cmd [[ botright split Todo g]]
    end, { desc = 'Open Bujo' })
  end,
}
