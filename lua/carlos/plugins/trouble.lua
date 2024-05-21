return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    height = 15,
  },
  init = function()
    local trouble = require 'trouble'

    vim.keymap.set('n', '<leader>xx', trouble.toggle)

    vim.keymap.set('n', '<leader>xw', function()
      trouble.toggle 'workspace_diagnostics'
    end)

    vim.keymap.set('n', '<leader>xd', function()
      trouble.toggle 'document_diagnostics'
    end)

    vim.keymap.set('n', '<leader>xq', function()
      trouble.toggle 'quickfix'
    end)

    vim.keymap.set('n', '<leader>xl', function()
      trouble.toggle 'loclist'
    end)

    -- vim.keymap.set('n', 'gd', function()
    --   trouble.toggle 'lsp_definitions'
    -- end)

    vim.keymap.set('n', 'gR', function()
      trouble.toggle 'lsp_references'
    end)

    vim.keymap.set('n', 'gI', function()
      trouble.toggle 'lsp_implementations'
    end)

    vim.keymap.set('n', ']x', function()
      if not trouble.is_open() then
        trouble.open {}
      end
      trouble.next { skip_groups = true, jump = true }
    end)

    vim.keymap.set('n', '[x', function()
      if not trouble.is_open() then
        trouble.open {}
      end
      trouble.previous { skip_groups = true, jump = true }
    end)
  end,
}
