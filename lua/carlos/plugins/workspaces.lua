return {
  'natecraddock/workspaces.nvim',
  cmd = { 'WorkspacesAdd', 'WorkspacesList', 'WorkspacesOpen' },
  config = function()
    require('workspaces').setup {
      hooks = {
        open = 'FzfLua files',
      },
    }
  end,
}
