return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  branch = 'master',
  -- According to the docs treesitter doesn't support lazy loading
  -- event = { 'BufReadPre', 'BufNewFile', 'VeryLazy' },
  -- lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'cpp',
      'css',
      'diff',
      'html',
      'javascript',
      'json',
      'json5',
      'jsonc',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'tsx',
      'typescript',
      'vim',
      'vimdoc',
      'yaml',
    },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = {
      enable = true,
      disable = { 'ruby' },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        include_surrounding_whitespace = false,
        keymaps = {
          ['af'] = {
            query = '@function.outer',
            desc = 'select around a function',
          },
          ['if'] = {
            query = '@function.inner',
            desc = 'select inner part of a function',
          },
          ['aC'] = {
            query = '@class.outer',
            desc = 'select around a class',
          },
          ['iC'] = {
            query = '@class.inner',
            desc = 'select inner part of a class',
          },
          ['ac'] = {
            query = '@comment.outer',
            desc = 'select around a comment',
          },
          ['ic'] = {
            query = '@comment.inner',
            desc = 'select inner part of a comment',
          },
          ['as'] = {
            query = '@local.scope',
            query_group = 'locals',
            desc = 'Select language scope',
          },
        },
      },
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        -- maps in normal mode to init the node/scope selection with space
        init_selection = '<leader>,',
        -- increment to the upper named parent
        node_incremental = ',',
        -- decrement to the previous node
        node_decremental = '<bs>',
        -- increment to the upper scope (as defined in locals.scm)
        scope_incremental = '<tab>',
      },
    },
  },
  opts_extend = { 'ensure_installed' },
  config = function(_, opts)
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup(opts)
  end,
}
