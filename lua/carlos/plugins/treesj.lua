return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {
    use_default_keymaps = false,
    max_join_length = 170,
  },
  keys = {
    {
      '<leader>m',
      function()
        require('treesj').toggle()
      end,
      desc = 'Toggle split/join',
    },
    {
      '<leader>M',
      function()
        require('treesj').toggle { split = { recursive = true } }
      end,
      desc = 'Toggle split/join recursively',
    },
  },
}
