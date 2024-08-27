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

vim.api.nvim_create_user_command('FullFilePath', function()
  local fullFilePath = vim.fn.expand '%:p'
  vim.fn.setreg('+', fullFilePath)
  print(fullFilePath)
end, { desc = 'Copy full path of current buffer to clipboard' })

vim.api.nvim_create_user_command('FilePath', function()
  local filePath = vim.fn.expand '%:p:~:.'
  vim.fn.setreg('+', filePath)
  print(filePath)
end, { desc = 'Copy relative path of current buffer to clipboard' })
