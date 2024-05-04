return {
  'carloscalla/harpoon',
  config = function()
    require('harpoon').setup {
      menu = {
        width = math.floor(vim.api.nvim_win_get_width(0) * 0.55),
      },
    }
  end,
  keys = {
    { '<leader>ha', "<cmd>lua require('harpoon.mark').add_file()<CR>", 'n' },
    { '<leader>ht', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", 'n' },
    { '<leader>hp', "<cmd>lua require('harpoon.ui').nav_prev()<CR>", 'n' },
    { '<leader>hn', "<cmd>lua require('harpoon.ui').nav_next()<CR>", 'n' },
  },
}
