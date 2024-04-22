return {
  'carloscalla/harpoon',
  config = function()
    require('harpoon').setup {
      menu = {
        width = math.floor(vim.api.nvim_win_get_width(0) * 0.55),
      },
    }
  end,
}
