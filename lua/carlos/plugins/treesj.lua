return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {
    use_default_keymaps = false,
  },
  keys = {
    {
      '<leader>m',
      function()
        require('treesj').toggle()
      end,
    },
    {
      '<leader>M',
      function()
        require('treesj').toggle { split = { recursive = true } }
      end,
    },
  },
}
