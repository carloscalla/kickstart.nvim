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
