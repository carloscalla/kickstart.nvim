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
    -- This repo gets latest Vim plugin file from GitHub rather than the one included in the package manager.
    'junegunn/fzf',
    --[[ 
        The below install script is only needed if fzf is not installed in your system or if you want the latest from Github.
        It first picks up the fzf binary available on the system. If it's not the latest version, it will install the latest from GitHub.
        Most likely GitHub has a more recent version than the one included in the package (Homebrew), not urgent though
    --]]
    -- build = function()
    --   vim.fn['fzf#install']()
    -- end,
  },
}
