return {
  'Wansmer/treesj',
  -- keys = { '<space>m', '<space>j', '<space>s' },
  keys = { '<space>m' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('treesj').setup {}
  end,
}
