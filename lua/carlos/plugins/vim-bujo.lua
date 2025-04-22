return {
  'vuciv/vim-bujo',
  init = function()
    vim.cmd [[ let g:bujo#todo_file_path = $HOME . "/.cache/bujo" ]]
  end,
}
