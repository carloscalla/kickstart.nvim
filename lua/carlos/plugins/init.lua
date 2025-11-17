return {
  -- Utils
  -- { 'nvim-lua/plenary.nvim', lazy = true }, -- Useful lua functions used by lots of plugins
  -- { 'nvim-tree/nvim-web-devicons', lazy = true }, -- Icons for Neovim plugins
  -- { 'MunifTanjim/nui.nvim', lazy = true }, -- UI components for Neovim plugins

  -- Trying not lazy loading to avoid warnings in some plugins
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-tree/nvim-web-devicons' },
  { 'MunifTanjim/nui.nvim' },

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-repeat', event = 'VeryLazy' },
  {
    'folke/todo-comments.nvim', -- Highlight todo, notes, etc in comments
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePost' },
    -- Uses:
    -- 'nvim-lua/plenary.nvim',
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
    -- Uses:
    -- 'nvim-tree/nvim-web-devicons',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
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
      code = {
        width = 'block',
        right_pad = 3,
      },
    },
    opts_extend = { 'file_types' },
  },
  {
    'kosayoda/nvim-lightbulb',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePost' },
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
    cmd = { 'Neogen' },
    opts = {},
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
  {
    'carloscalla/notepad.nvim',
    cmd = { 'Notepad' },
    opts = {
      position = 'left',
      split_size = 0.3,
    },
  },
}
