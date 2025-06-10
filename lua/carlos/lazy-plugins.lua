-- [[ Configure and install plugins ]]
--
-- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
require('lazy').setup({

  -- Uncomment any of the lines below to enable them (you will need to restart nvim).

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/carlos/plugins/*.lua`

  { import = 'carlos.plugins' },

  -- Uncomment below line to add your plugins under `lua/custom/plugins/*.lua`
  -- { import = 'custom.plugins' },

  -- Path `lua/custom/` is in the gitignore.
  -- Use it to add your own config, plugins or overrides.
  --
  -- You can require individual files or use the import syntax to load all files in a directory.
  --
  -- E.g.: lua/custom/plugins/init.lua
  --[[
  return {
    { import = 'juanchi.plugins' },
    require 'extras.plugins.copilot',
    require 'extras.plugins.avante',
    require 'extras.plugins.debug',
  }
  --]]
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
