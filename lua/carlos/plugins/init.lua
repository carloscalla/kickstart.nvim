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
}
