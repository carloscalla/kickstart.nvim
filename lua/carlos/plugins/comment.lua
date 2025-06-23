-- "gc" to comment visual regions/lines
return {
  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    config = function()
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    -- dependencies = {
    --   'nvim-treesitter/nvim-treesitter',
    -- },
    lazy = true,
    opts = { enable_autocmd = false },
  },
}
