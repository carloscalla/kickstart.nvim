return {
  {
    'nvim-neotest/neotest',
    -- Uses:
    -- 'nvim-lua/plenary.nvim',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-jest',
      'marilari88/neotest-vitest',
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-jest',
          require 'neotest-vitest',
        },
      }
    end,
    keys = {
      -- stylua: ignore start
      { '<leader>tf', function() require('neotest').run.run(vim.fn.expand '%') end,      desc = 'Test: Run File' },
      { '<leader>tr', function() require('neotest').run.run() end,                       desc = 'Test: Run Nearest' },
      { '<leader>tl', function() require('neotest').run.run_last() end,                  desc = 'Test: Run Last' },
      { '<leader>ts', function() require('neotest').summary.toggle() end,                desc = 'Test: Toggle Summary' },
      { '<leader>tO', function() require('neotest').output_panel.toggle() end,           desc = 'Test: Toggle Output Panel' },
      { '<leader>tS', function() require('neotest').run.stop() end,                      desc = 'Test: Stop' },
      { '<leader>tw', function() require('neotest').watch.toggle() end,                  desc = 'Test: Toggle Watch' },
      { '<leader>tW', function() require('neotest').watch.toggle(vim.fn.expand '%') end, desc = 'Test: Toggle Watch File' },
      -- stylua: ignore end
      {
        '<leader>to',
        function()
          require('neotest').output.open { enter = true, auto_close = true }
        end,
        desc = 'Test: Show Output',
      },
    },
  },
  {
    'vim-test/vim-test',
    dependencies = {
      'akinsho/toggleterm.nvim',
    },
    cmd = {
      'TestNearest',
      'TestFile',
      'TestSuite',
      'TestLast',
      'TestVisit',
    },
    init = function()
      vim.cmd [[let test#strategy = "toggleterm"]]
    end,
  },
}
