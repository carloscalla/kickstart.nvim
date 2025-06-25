return {
  'kdheepak/lazygit.nvim',
  lazy = true,
  -- Uses:
  -- 'nvim-lua/plenary.nvim',
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  -- Disabling temporarily to use toggleterm.nvim because it
  -- integrates better with the edit action
  -- Re-enabling because I'm having problems with toggleterm running lazygit
  ---[[
  keys = {
    { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
  },
  --]]
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
