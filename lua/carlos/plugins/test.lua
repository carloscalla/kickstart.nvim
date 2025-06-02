return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
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
      { '<leader>tf', function() require('neotest').run.run(vim.fn.expand '%') end,      desc = 'Run File' },
      { '<leader>tr', function() require('neotest').run.run() end,                       desc = 'Run Nearest' },
      { '<leader>tl', function() require('neotest').run.run_last() end,                  desc = 'Run Last' },
      { '<leader>ts', function() require('neotest').summary.toggle() end,                desc = 'Toggle Summary' },
      { '<leader>tO', function() require('neotest').output_panel.toggle() end,           desc = 'Toggle Output Panel' },
      { '<leader>tS', function() require('neotest').run.stop() end,                      desc = 'Stop' },
      { '<leader>tw', function() require('neotest').watch.toggle() end,                  desc = 'Toggle Watch' },
      { '<leader>tW', function() require('neotest').watch.toggle(vim.fn.expand '%') end, desc = 'Toggle Watch File' },
      -- stylua: ignore end
      {
        '<leader>to',
        function()
          require('neotest').output.open { enter = true, auto_close = true }
        end,
        desc = 'Show Output',
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
