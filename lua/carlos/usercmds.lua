vim.api.nvim_create_user_command('PersistenceRestoreCwd', function()
  require('persistence').load()
end, {
  desc = 'Restore the session for the current directory',
})

vim.api.nvim_create_user_command('PersistenceRestoreLast', function()
  require('persistence').load { last = true }
end, {
  desc = 'Restore the last session',
})

vim.api.nvim_create_user_command('PersistenceStop', function()
  require('persistence').stop()
end, {
  desc = "Stop Persistence => session won't be saved on exit",
})
