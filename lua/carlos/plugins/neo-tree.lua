return {
  'nvim-neo-tree/neo-tree.nvim',
  -- version = '*',
  branch = 'v3.x',
  -- Not lazy loading also gets rid of the problem when it opens the file in the first window
  -- lazy = false, -- neo-tree will lazily load itself
  cmd = 'Neotree', -- lazy load on command since I'm not using this anymore but might want to have it handy
  -- Uses:
  -- 'nvim-tree/nvim-web-devicons'
  -- 'nvim-lua/plenary.nvim',
  -- 'MunifTanjim/nui.nvim',
  dependencies = {
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
          -- ['h'] = 'close_node',
          ['s'] = 'open_split',
          ['v'] = 'open_vsplit',
        },
      },
    }
  end,
  keys = {
    -- { '<leader>nt', ':Neotree float toggle<CR>', desc = 'Toggle Neo-tree' },
    -- { '<leader>nb', ':Neotree float buffers<CR>', desc = 'Neo-tree buffers' },
    -- { '<leader>fi', ':Neotree float reveal<CR>', desc = 'Neo-tree reveal current file' },

    -- { '<leader>ng', ':Neotree float git_status<CR>', desc = 'Neo-tree git status' },
  },
}
