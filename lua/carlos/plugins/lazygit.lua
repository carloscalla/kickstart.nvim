return {
  'kdheepak/lazygit.nvim',
  lazy = true,
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
  },
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'lazygit' },
      callback = function()
        vim.keymap.set('t', '<Esc><Esc>', 'q', { buffer = 0, desc = 'Exit LazyGit' })
      end,
    })
  end,
}
