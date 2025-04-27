return {
  'gbprod/yanky.nvim',
  dependencies = {
    'folke/snacks.nvim',
  },
  opts = {
    highlight = {
      timer = 200,
    },
  },
  keys = {
    {
      '<leader>y',
      function()
        Snacks.picker.yanky()
      end,
      desc = 'Open Yank History',
    },

    -- Preserve cursor position on Yank
    { 'y', '<Plug>(YankyYank)', mode = { 'n', 'x' }, desc = 'Yank text' },

    -- Put yanked text
    { 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' }, desc = 'Put yanked text after cursor' },
    { 'P', '<Plug>(YankyPutBefore)', mode = { 'n', 'x' }, desc = 'Put yanked text before cursor' },
    { 'gp', '<Plug>(YankyGPutAfter)', mode = { 'n', 'x' }, desc = 'Put yanked text after selection' },
    { 'gP', '<Plug>(YankyGPutBefore)', mode = { 'n', 'x' }, desc = 'Put yanked text before selection' },

    -- Cycling yank ring
    { '<c-p>', '<Plug>(YankyPreviousEntry)', desc = 'Select previous entry through yank history' },
    { '<c-n>', '<Plug>(YankyNextEntry)', desc = 'Select next entry through yank history' },

    -- From vim-unimpaired tpope the man
    { ']p', '<Plug>(YankyPutIndentAfterLinewise)', desc = 'Put indented after cursor (linewise)' },
    { '[p', '<Plug>(YankyPutIndentBeforeLinewise)', desc = 'Put indented before cursor (linewise)' },
    { ']P', '<Plug>(YankyPutIndentAfterLinewise)', desc = 'Put indented after cursor (linewise)' },
    { '[P', '<Plug>(YankyPutIndentBeforeLinewise)', desc = 'Put indented before cursor (linewise)' },

    { '>p', '<Plug>(YankyPutIndentAfterShiftRight)', desc = 'Put and indent right' },
    { '<p', '<Plug>(YankyPutIndentAfterShiftLeft)', desc = 'Put and indent left' },
    { '>P', '<Plug>(YankyPutIndentBeforeShiftRight)', desc = 'Put before and indent right' },
    { '<P', '<Plug>(YankyPutIndentBeforeShiftLeft)', desc = 'Put before and indent left' },

    { '=p', '<Plug>(YankyPutAfterFilter)', desc = 'Put after applying a filter' },
    { '=P', '<Plug>(YankyPutBeforeFilter)', desc = 'Put before applying a filter' },
  },
}
