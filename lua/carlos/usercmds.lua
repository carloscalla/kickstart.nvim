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

vim.api.nvim_create_user_command('FileName', function()
  local fileName = vim.fn.expand '%:t'
  vim.fn.setreg('+', fileName)
  print(fileName)
end, { desc = 'Copy file name of current buffer to clipboard' })

vim.api.nvim_create_user_command('NearestPackagePath', function()
  local Path = require 'plenary.path'
  local current_file_path = Path:new(vim.fn.expand '%:p')
  local nearest_package_json = current_file_path:find_upwards 'package.json'

  if nearest_package_json and nearest_package_json:exists() then
    local package_dir = vim.fn.fnamemodify(nearest_package_json:absolute(), ':h:p')
    vim.fn.setreg('+', package_dir)
    print(package_dir)
  else
    vim.notify(string.format "Can't find a parent package.json", vim.log.levels.ERROR, { title = "Couldn't find ancestor package.json" })
  end
end, { desc = 'Copy file name of current buffer to clipboard' })

pcall(require, 'custom.usercmds')
