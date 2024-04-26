return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-context',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'cpp',
      'css',
      'html',
      'javascript',
      'json',
      'lua',
      'luadoc',
      'markdown',
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
          ['aF'] = {
            query = '@function.outer',
            desc = 'select around a function',
          },
          ['iF'] = {
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
        },
      },
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        -- maps in normal mode to init the node/scope selection with space
        init_selection = ',',
        -- increment to the upper named parent
        node_incremental = ',',
        -- decrement to the previous node
        node_decremental = '<bs>',
        -- increment to the upper scope (as defined in locals.scm)
        scope_incremental = '<tab>',
      },
    },
  },
  config = function(_, opts)
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

    -- Prefer git instead of curl in order to improve connectivity in some environments
    require('nvim-treesitter.install').prefer_git = true
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup(opts)

    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  end,
}
