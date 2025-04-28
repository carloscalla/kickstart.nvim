return {
  'https://github.com/mhinz/vim-grepper',
  cmd = { 'Grepper', 'GrepperGit', 'GrepperRg', 'GrepperGrep' },
  config = function()
    vim.cmd [[ let g:grepper.rg.grepprg .= ' --smart-case' ]]
  end,
}
