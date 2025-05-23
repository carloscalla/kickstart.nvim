return {
  {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter' },
    },
    opts = {
      preview = {
        win_height = 25,
      },
    },
  },
  {
    'junegunn/fzf',
    build = function()
      vim.fn['fzf#install']()
    end,
  },
}
