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
        -- Fix <Esc>
        -- Reset the terminal mode keymap <Esc><Esc> to exit terminal mode in keymaps.lua
        vim.keymap.set('t', '<Esc>', '<Esc>', { buffer = 0, nowait = true })
      end,
    })
  end,
}
