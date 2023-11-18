return {
  "ThePrimeagen/harpoon",
  config = function()
    require("harpoon").setup({
      menu = {
        -- width = vim.api.nvim_win_get_width(0) - 100,
        -- width = 100,
        width = math.floor(vim.api.nvim_win_get_width(0) * 0.55),
      }
    })
  end
}

