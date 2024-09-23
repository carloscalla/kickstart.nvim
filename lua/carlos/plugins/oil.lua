-- Declare a global function to retrieve the current directory
function _G.get_oil_winbar()
  local dir = require('oil').get_current_dir()
  if dir then
    return vim.fn.fnamemodify(dir, ':~')
  else
    -- If there is no current directory (e.g. over ssh), just show the buffer name
    return vim.api.nvim_buf_get_name(0)
  end
end

return {
  'stevearc/oil.nvim',
  opts = {
    default_file_explorer = false,
    win_options = {
      winbar = '%!v:lua.get_oil_winbar()',
    },
    float = {
      win_options = {
        winbar = '',
      },
    },
  },
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  cmd = { 'Oil' },
  keys = {
    {
      '<leader>of',
      function()
        require('oil').toggle_float()
      end,
      { desc = 'Toggle Oil float' },
    },
  },
}
