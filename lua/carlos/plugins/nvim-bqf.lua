return {
  'kevinhwang91/nvim-bqf',
  ft = 'qf',
  dependencies = {
    'junegunn/fzf',
    build = function()
      -- The following line is not working, I don't know why yet
      -- It's not a problem since I install fzf through homebrew
      -- vim.fn['fzf#install']()
    end,
  },
  opts = {
    preview = {
      win_height = 20,
    },
  },
}
