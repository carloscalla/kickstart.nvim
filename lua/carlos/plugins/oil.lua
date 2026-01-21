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

vim.api.nvim_create_autocmd('User', {
  pattern = 'OilActionsPost',
  callback = function(event)
    if event.data.actions[1].type == 'move' then
      Snacks.rename.on_rename_file(event.data.actions[1].src_url, event.data.actions[1].dest_url)
    end
  end,
})

local detail = false
return {
  'stevearc/oil.nvim',
  lazy = false, -- because we are replacing netrw with Oil
  -- Uses:
  -- 'nvim-tree/nvim-web-devicons',
  dependencies = {
    'folke/snacks.nvim',
    { 'smiggiddy/git-oil.nvim', opts = { keymaps = { toggle = false } } },
  },
  cmd = { 'Oil' },
  opts = {
    default_file_explorer = true,
    win_options = {
      winbar = '%!v:lua.get_oil_winbar()',
    },
    float = {
      border = 'single',
      get_win_title = function()
        return 'Oil'
      end,
      max_width = 120,
      max_height = 40,
    },
    confirmation = {
      border = 'single',
    },
    keymaps = {
      ['gd'] = {
        desc = 'Toggle file detail view',
        callback = function()
          detail = not detail
          if detail then
            require('oil').set_columns { 'icon', 'permissions', 'size', 'mtime' }
          else
            require('oil').set_columns { 'icon' }
          end
        end,
      },
      ['<C-l>'] = false,
      ['<C-h>'] = false,
      ['<C-v>'] = { 'actions.select', opts = { vertical = true } },
      ['<C-s>'] = { 'actions.select', opts = { horizontal = true } },
      ['<C-x>'] = 'actions.refresh',
    },
  },
  keys = {
    {
      '<leader>of',
      function()
        require('oil').toggle_float()
      end,
      desc = 'Toggle Oil float',
    },
    {
      '<leader>-',
      function()
        require('oil').open()
      end,
      desc = 'Oil',
    },
  },
}
