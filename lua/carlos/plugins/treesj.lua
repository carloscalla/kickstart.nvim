return {
  'Wansmer/treesj',
  keys = { '<leader>m' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('treesj').setup {
      ---@type boolean Use default keymaps (<space>m - toggle, <space>j - join, <space>s - split)
      use_default_keymaps = false,
    }
    -- For default preset
    vim.keymap.set('n', '<leader>m', require('treesj').toggle)
    -- For extending default preset with `recursive = true`
    vim.keymap.set('n', '<leader>M', function()
      require('treesj').toggle { split = { recursive = true } }
    end)
  end,
}
