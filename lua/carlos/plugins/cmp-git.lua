return {
  'petertriho/cmp-git',
  enabled = false,
  dependencies = { 'hrsh7th/nvim-cmp' },
  opts = {
    -- options go here
  },
  init = function()
    table.insert(require('cmp').get_config().sources, { name = 'git' })
  end,
}
