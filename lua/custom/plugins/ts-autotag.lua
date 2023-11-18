return {
  'windwp/nvim-ts-autotag',
  config = function()
    require("nvim-ts-autotag").setup {
      enable = true,
      enable_rename = true,
      enable_close = true,
      enable_close_on_slash = false,
    }
  end,
}
