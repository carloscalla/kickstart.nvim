return {
  'carloscalla/harpoon',
  branch = 'harpoon2_custom',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    settings = {
      save_on_toggle = true,
    },
  },
  keys = function()
    local keys = {
      {
        '<leader>ha',
        function()
          require('harpoon'):list():add()
        end,
        desc = 'Harpoon File',
      },
      {
        '<leader>ht',
        function()
          local harpoon = require 'harpoon'
          harpoon.ui:toggle_quick_menu(harpoon:list(), { height_in_lines = 10 })
        end,
        desc = 'Harpoon Quick Menu',
      },
    }

    for i = 1, 5 do
      table.insert(keys, {
        '<leader>' .. i,
        function()
          require('harpoon'):list():select(i)
        end,
        desc = 'Harpoon to File ' .. i,
      })
    end

    for i = 1, 5 do
      table.insert(keys, {
        '<leader>h' .. i,
        function()
          require('harpoon'):list():replace_at(i)
        end,
        desc = 'Harpoon replace to File ' .. i,
      })
    end

    return keys
  end,
  config = function(_, opts)
    local harpoon = require 'harpoon'
    harpoon.setup(opts)

    local harpoon_extensions = require 'harpoon.extensions'
    harpoon:extend(harpoon_extensions.builtins.highlights())
  end,
}
