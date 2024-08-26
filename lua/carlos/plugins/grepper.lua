return {
  'https://github.com/mhinz/vim-grepper',
  config = function()
    vim.cmd [[ let g:grepper.rg.grepprg .= ' --smart-case' ]]
  end,
}
