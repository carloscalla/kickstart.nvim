return {
  'natecraddock/workspaces.nvim',
  cmd = { 'WorkspacesAdd', 'WorkspacesList', 'WorkspacesOpen' },
  config = function()
    require('workspaces').setup {
      hooks = {
        open = function(name, path)
          vim.cmd '%bd'
          vim.notify(string.format('Workspace [%s -> %s] opened', name, path), vim.log.levels.INFO, { title = 'workspaces.nvim' })
        end,
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
