return {
  {
    'akinsho/toggleterm.nvim',
    dependencies = {
      'ryanmsnyder/toggleterm-manager.nvim',
      dependencies = {
        'nvim-telescope/telescope.nvim',
        'nvim-lua/plenary.nvim', -- only needed because it's a dependency of telescope
      },
      config = true,
    },
    version = '*',
    config = function()
      require('toggleterm').setup {
        size = 30,
        direction = 'horizontal',
      }
    end,
    keys = {
      { '<leader>tt', '<Cmd>ToggleTerm<CR>' },
    },
  },
  -- Original toggleterm-manager config from docs
  -- {
  --   'ryanmsnyder/toggleterm-manager.nvim',
  --   lazy = true,
  --   dependencies = {
  --     'akinsho/toggleterm.nvim',
  --     'nvim-telescope/telescope.nvim',
  --     'nvim-lua/plenary.nvim', -- only needed because it's a dependency of telescope
  --   },
  -- },
}
