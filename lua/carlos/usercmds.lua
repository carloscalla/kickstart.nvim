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
  vim.fn.setreg('+', vim.fn.expand '%:p')
end, { desc = 'Copy full path of current buffer to clipboard' })

vim.api.nvim_create_user_command('FilePath', function()
  -- copy relative path of current buffer to clipboard
  vim.fn.setreg('+', vim.fn.expand '%:~:.')
end, { desc = 'Copy relative path of current buffer to clipboard' })
