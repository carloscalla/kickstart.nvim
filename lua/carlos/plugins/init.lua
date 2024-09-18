return {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-repeat', event = 'VeryLazy' },
  {
    'tpope/vim-surround',
    --[[
    config = function()
      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      map('n', 'gsd', '<Plug>Dsurround')
      map('n', 'gsc', '<Plug>Csurround')
      map('n', 'gsC', '<Plug>CSurround')
      map('n', 'gsy', '<Plug>Ysurround')
      map('n', 'gsY', '<Plug>YSurround')
      map('n', 'gsyy', '<Plug>Yssurround')
      map('n', 'gsYy', '<Plug>YSsurround')
      map('n', 'gsYY', '<Plug>YSsurround')
      map('x', 'S', '<Plug>VSurround')
      map('x', 'gS', '<Plug>VgSurround')

      -- nmap ds  <Plug>Dsurround
      -- nmap cs  <Plug>Csurround
      -- nmap cS  <Plug>CSurround
      -- nmap ys  <Plug>Ysurround
      -- nmap yS  <Plug>YSurround
      -- nmap yss <Plug>Yssurround
      -- nmap ySs <Plug>YSsurround
      -- nmap ySS <Plug>YSsurround
      -- xmap S   <Plug>VSurround
      -- xmap gS  <Plug>VgSurround
    end,
  ]]
  },
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
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    'mbbill/undotree',
    keys = {
      { '<leader>u', '<Cmd>UndotreeToggle<CR>' },
    },
    init = function()
      vim.cmd [[let g:undotree_WindowLayout = 2]]
      vim.cmd [[let g:undotree_DiffpanelHeight = 15]]
    end,
  },
  -- { 'tpope/vim-commentary' },
  {
    'nvim-pack/nvim-spectre',
    cmd = 'Spectre',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },

  -- Git related plugins
  {
    'tpope/vim-fugitive',
    cmd = {
      'Git',
      'G',
      'Gdiffsplit',
      'Gvdiffsplit',
      'Gedit',
      'Gsplit',
      'GMove',
      'Gread',
      'Gwrite',
      'GDelete',
      'GRemove',
      'GMove',
      'GRename',
      'Ggrep',
      'Glgrep',
      -- 'GBrowse',
    },
  },
  {
    'tpope/vim-rhubarb',
    cmd = 'GBrowse',
    dependencies = { 'tpope/vim-fugitive' },
  },
}
