return {
  'github/copilot.vim',
  enabled = false,
  config = function()
    vim.keymap.set('i', '<C-i>', 'copilot#Accept()', { noremap = true, expr = true, silent = true, replace_keycodes = false })
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true
  end,
}
