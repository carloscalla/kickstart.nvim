return {
  'natecraddock/workspaces.nvim',
  cmd = { 'WorkspacesOpen' },
  config = function()
    require('workspaces').setup {
      hooks = {
        open = 'FzfLua files',
      },
    }
  end,
}
