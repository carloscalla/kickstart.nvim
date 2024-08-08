return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    {
      '<leader>xw',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>xx',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>cs',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = 'Symbols (Trouble)',
    },
    {
      '<leader>cl',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = 'LSP Definitions / references / ... (Trouble)',
    },
    {
      '<leader>xl',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Location List (Trouble)',
    },
    {
      '<leader>xq',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Quickfix List (Trouble)',
    },
    {
      'gR',
      '<cmd>Trouble lsp_references toggle<cr>',
      desc = 'LSP References (Trouble)',
    },
    {
      'gI',
      '<cmd>Trouble lsp_implementations toggle<cr>',
      desc = 'LSP Implementations (Trouble)',
    },
  },
  opts = {},
  -- v2 config
  -- opts = {
  --   height = 50,
  -- },
  -- init = function()
  --   local trouble = require 'trouble'
  --
  --   vim.keymap.set('n', '<leader>xx', trouble.toggle)
  --
  --   vim.keymap.set('n', '<leader>xw', function()
  --     trouble.toggle 'workspace_diagnostics'
  --   end)
  --
  --   vim.keymap.set('n', '<leader>xd', function()
  --     trouble.toggle 'document_diagnostics'
  --   end)
  --
  --   vim.keymap.set('n', '<leader>xq', function()
  --     trouble.toggle 'quickfix'
  --   end)
  --
  --   vim.keymap.set('n', '<leader>xl', function()
  --     trouble.toggle 'loclist'
  --   end)
  --
  --   -- vim.keymap.set('n', 'gd', function()
  --   --   trouble.toggle 'lsp_definitions'
  --   -- end)
  --
  --   vim.keymap.set('n', 'gR', function()
  --     trouble.toggle 'lsp_references'
  --   end)
  --
  --   vim.keymap.set('n', 'gI', function()
  --     trouble.toggle 'lsp_implementations'
  --   end)
  --
  --   vim.keymap.set('n', ']x', function()
  --     if not trouble.is_open() then
  --       trouble.open {}
  --     end
  --     trouble.next { skip_groups = true, jump = true }
  --   end)
  --
  --   vim.keymap.set('n', '[x', function()
  --     if not trouble.is_open() then
  --       trouble.open {}
  --     end
  --     trouble.previous { skip_groups = true, jump = true }
  --   end)
  -- end,
}
