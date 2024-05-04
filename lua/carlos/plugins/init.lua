return {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'vuciv/vim-bujo',
  'tpope/vim-repeat',
  'tpope/vim-surround',
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
  {
    'mbbill/undotree',
    keys = {
      { '<leader>u', '<Cmd>UndotreeToggle<CR>' },
    },
  },
  -- { 'tpope/vim-commentary' },
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

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
}
