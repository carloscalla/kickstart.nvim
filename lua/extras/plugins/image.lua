-- NOTE: This plugin requires you to add the following option in your lazy setup call
-- rocks = {
--   hererocks = true,
-- },

return {
  '3rd/image.nvim',
  lazy = false,
  opts = {
    integrations = {
      markdown = {
        enabled = true,
      },
      neorg = {
        enabled = true,
      },
      typst = {
        enabled = true,
      },
      html = {
        enabled = true,
      },
      css = {
        enabled = true,
      },
    },
  },
  keys = {
    {
      '<leader>it',
      function()
        local image = require 'image'
        if image.is_enabled() then
          image.disable()
        else
          image.enable()
        end
      end,
      desc = 'Toggle image render',
    },
  },
}
