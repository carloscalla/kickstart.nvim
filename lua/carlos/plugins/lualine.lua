return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  -- Uses:
  -- 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      -- icons_enabled = false,
      icons_enabled = true,
      theme = 'onedark',
      component_separators = '|',
      section_separators = '',
    },
  },
}
