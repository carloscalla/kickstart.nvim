return {
  'https://github.com/mhinz/vim-grepper',
  enabled = false,
  config = function()
    vim.cmd [[ let g:grepper.rg.grepprg .= ' --smart-case' ]]
  end,
}
