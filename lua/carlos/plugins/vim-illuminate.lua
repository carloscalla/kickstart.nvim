return {
  'RRethy/vim-illuminate',
  lazy = false,
  opts = {
    delay = 150,
    disable_keymaps = true,
  },
  config = function(_, opts)
    require('illuminate').configure(opts)
  end,
  keys = {
    {
      '[[',
      function()
        require('illuminate').goto_prev_reference()
      end,
      desc = 'Illuminate Prev Reference',
    },
    {
      ']]',
      function()
        require('illuminate').goto_next_reference()
      end,
      desc = 'Illuminate Next Reference',
    },
  },
}
