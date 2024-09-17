return {
  'natecraddock/workspaces.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  cmd = { 'WorkspacesOpen' },
  config = function()
    require('workspaces').setup()
    require('telescope').load_extension 'workspaces'
  end,
}
