return {
  -- Open files and command output from wezterm, kitty, and neovim terminals in
  -- your current neovim instance
  'willothy/flatten.nvim',
  -- Ensure that it runs first to minimize delay when opening file from terminal
  lazy = false,
  priority = 1001,
  enabled = false, -- Disabling because it breaks neotest :(
  dependencies = { 'akinsho/toggleterm.nvim' },
  opts = function()
    ---@type Terminal?
    local saved_terminal

    return {
      window = {
        open = 'alternate',
      },
      hooks = {
        pre_open = function()
          local term = require 'toggleterm.terminal'
          local termid = term.get_focused_id()
          saved_terminal = term.get(termid)
        end,
        post_open = function(bufnr, winnr, ft, is_blocking)
          if saved_terminal and vim.bo[saved_terminal.bufnr].filetype == 'lazygit' then
            saved_terminal:shutdown()
          else
            -- If it's a normal file, just switch to its window
            vim.api.nvim_set_current_win(winnr)
          end
        end,
      },
    }
  end,
}
