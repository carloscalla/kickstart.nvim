return {
  'github/copilot.vim',
  -- event = { 'BufReadPost', 'BufNewFile', 'BufWritePost' },
  init = function()
    vim.g.copilot_no_tab_map = true
  end,
  config = function()
    vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
    })
  end,
}
