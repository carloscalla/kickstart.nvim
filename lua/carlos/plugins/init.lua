return {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  {
    'folke/todo-comments.nvim', -- Highlight todo, notes, etc in comments
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      signs = false,
    },
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
  'vuciv/vim-bujo',
  'tpope/vim-repeat',
  'tpope/vim-surround',
  'mbbill/undotree',
  -- { 'tpope/vim-commentary' },

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  {
    'nvim-pack/nvim-spectre',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    'ryanmsnyder/toggleterm-manager.nvim',
    dependencies = {
      'akinsho/nvim-toggleterm.lua',
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim', -- only needed because it's a dependency of telescope
    },
    config = true,
  },
}
