return {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-repeat', event = 'VeryLazy' },
  {
    'folke/todo-comments.nvim', -- Highlight todo, notes, etc in comments
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      signs = false,
    },
  },
  {
    'mbbill/undotree',
    keys = {
      {
        '<leader>u',
        '<Cmd>UndotreeToggle<CR>',
        desc = 'Toggle Undotree',
      },
    },
    init = function()
      vim.cmd [[let g:undotree_WindowLayout = 2]]
      vim.cmd [[let g:undotree_DiffpanelHeight = 15]]
    end,
  },
  {
    'rcarriga/nvim-notify',
    lazy = false,
    opts = {
      top_down = false,
    },
    config = function(_, opts)
      require('notify').setup(opts)
      vim.notify = require 'notify'
    end,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    ft = { 'markdown', 'norg', 'rmd', 'org', 'codecompanion' },
    opts = {
      file_types = { 'markdown', 'norg', 'rmd', 'org', 'codecompanion' },
      completions = {
        blink = {
          enabled = true,
        },
      },
    },
    opts_extend = { 'file_types' },
  },
  {
    'kosayoda/nvim-lightbulb',
    config = function()
      require('nvim-lightbulb').setup {
        autocmd = { enabled = true },
        sign = { enabled = true },
      }
    end,
  },
  {
    'previm/previm',
    ft = { 'mkd', 'markdown', 'mmd', 'mermaid', 'rst', 'textile', 'asciidoc', 'plantuml', 'html' },
    init = function()
      vim.cmd [[ let g:previm_open_cmd = 'open -a Google\ Chrome']]
    end,
  },
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
      'TmuxNavigatorProcessList',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>', desc = 'Move focus to the left window/tmux pane' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>', desc = 'Move focus to the right window/tmux pane' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>', desc = 'Move focus to the lower window/tmux pane' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>', desc = 'Move focus to the upper window/tmux pane' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>', desc = 'Move focus to the previous window/tmux pane' },
    },
  },
  {
    'danymat/neogen',
    opts = {},
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
}
