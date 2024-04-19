-- "gc" to comment visual regions/lines
return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup {
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    }
  end,
}