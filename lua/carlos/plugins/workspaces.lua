return {
  'natecraddock/workspaces.nvim',
  cmd = { 'WorkspacesAdd', 'WorkspacesList', 'WorkspacesOpen' },
  config = function()
    require('workspaces').setup {
      hooks = {
        -- open = 'FzfLua files',
        open = 'Oil .',
      },
    }
  end,
  keys = {
    {
      '<leader>sl',
      function()
        require('workspaces').open()
      end,
      mode = 'n',
      desc = 'Workspaces open',
    },
  },
}
