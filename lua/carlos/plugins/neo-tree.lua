return {
  'nvim-neo-tree/neo-tree.nvim',
  -- version = '*',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      filesystem = {
        hijack_netrw_behavior = 'disabled',
      },
    }
    vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]
  end,
  keys = {
    { '<leader>nt', ':Neotree float toggle<CR>', 'n' },
    { '<leader>nb', ':Neotree float buffers<CR>', 'n' },
    { '<leader>fi', ':Neotree float reveal<CR>', 'n' },
    -- { '<leader>fo', ':Neotree float focus<CR>', 'n' },
  },
}
