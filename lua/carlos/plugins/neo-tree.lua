return {
  'nvim-neo-tree/neo-tree.nvim',
  -- version = '*',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    'folke/snacks.nvim',
  },
  config = function(_, opts)
    local function on_move(data)
      Snacks.rename.on_rename_file(data.source, data.destination)
    end
    local events = require 'neo-tree.events'
    opts.event_handlers = opts.event_handlers or {}
    vim.list_extend(opts.event_handlers, {
      { event = events.FILE_MOVED, handler = on_move },
      { event = events.FILE_RENAMED, handler = on_move },
    })

    require('neo-tree').setup {
      filesystem = {
        hijack_netrw_behavior = 'disabled',
      },
      event_handlers = opts.event_handlers,
      window = {
        mappings = {
          ['h'] = 'close_node',
          ['s'] = 'open_split',
          ['v'] = 'open_vsplit',
        },
      },
    }
  end,
  keys = {
    { '<leader>nt', ':Neotree float toggle<CR>', 'n' },
    { '<leader>nb', ':Neotree float buffers<CR>', 'n' },
    { '<leader>fi', ':Neotree float reveal<CR>', 'n' },
    { '<leader>ng', ':Neotree float git_status<CR>', 'n' },
  },
}
