return {
  'windwp/nvim-ts-autotag',
  event = { 'BufReadPost', 'BufNewFile', 'BufWritePost' },
  config = function()
    require('nvim-ts-autotag').setup {
      opts = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = false,
      },
    }
  end,
}
