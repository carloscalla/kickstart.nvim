-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'vuciv/vim-bujo' },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
  -- { 'tpope/vim-commentary' },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-surround' },
  { 'mbbill/undotree' },

  -- Git related plugins
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-rhubarb' },
}
