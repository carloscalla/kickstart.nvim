return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    height = 15,
  },
  init = function()
    vim.keymap.set('n', '<leader>xx', require('trouble').toggle)

    vim.keymap.set('n', '<leader>xw', function()
      require('trouble').toggle 'workspace_diagnostics'
    end)

    vim.keymap.set('n', '<leader>xd', function()
      require('trouble').toggle 'document_diagnostics'
    end)

    vim.keymap.set('n', '<leader>xq', function()
      require('trouble').toggle 'quickfix'
    end)

    vim.keymap.set('n', '<leader>xl', function()
      require('trouble').toggle 'loclist'
    end)

    vim.keymap.set('n', 'gd', function()
      require('trouble').toggle 'lsp_definitions'
    end)

    vim.keymap.set('n', 'gr', function()
      require('trouble').toggle 'lsp_references'
    end)

    vim.keymap.set('n', 'gI', function()
      require('trouble').toggle 'lsp_implementations'
    end)

    vim.keymap.set('n', ']x', function()
      require('trouble').next { skip_groups = true, jump = true }
    end)

    vim.keymap.set('n', '[x', function()
      require('trouble').previous { skip_groups = true, jump = true }
    end)
  end,
}
