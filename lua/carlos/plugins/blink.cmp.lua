return { -- Autocompletion
  'saghen/blink.cmp',
  -- enabled = false,
  event = 'VimEnter',
  version = '1.*',
  dependencies = {
    -- Snippet Engine
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = (function()
        -- Build Step is needed for regex support in snippets.
        -- This step is not supported in many windows environments.
        -- Remove the below condition to re-enable on windows.
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        -- `friendly-snippets` contains a variety of premade snippets.
        --    See the README about individual language/framework/plugin snippets:
        --    https://github.com/rafamadriz/friendly-snippets
        -- {
        --   'rafamadriz/friendly-snippets',
        --   config = function()
        --     require('luasnip.loaders.from_vscode').lazy_load()
        --   end,
        -- },
      },
      opts = {},
    },
    'folke/lazydev.nvim',
    { 'allaman/emoji.nvim', opts = { enable_cmp_integration = true } },
    'saghen/blink.compat',
  },
  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      -- All presets have the following mappings:
      -- <tab>/<s-tab>: move to right/left of your snippet expansion
      -- <c-space>: Open menu or open docs if already open
      -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
      -- <c-e>: Hide menu
      -- <c-k>: Toggle signature help
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      preset = 'default',

      -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
      --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps

      ['<C-h>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-l>'] = { 'cancel', 'show' },
      ['<C-e>'] = { 'hide' },
      ['<C-y>'] = { 'select_and_accept' },

      -- ['<Tab>'] = {
      --   function(cmp)
      --     if cmp.snippet_active() then
      --       return cmp.accept()
      --     else
      --       return cmp.select_and_accept()
      --     end
      --   end,
      --   'snippet_forward',
      --   'fallback',
      -- },
      ['<Tab>'] = { 'select_and_accept', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

      ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
      ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

      ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },

      ['<C-j>'] = { 'snippet_forward', 'fallback' },
      -- ['<C-k>'] = { 'snippet_backward', 'fallback' },
      -- ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
      ['<C-k>'] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.snippet_backward()
          else
            return nil
          end
        end,
        'show_signature',
        'hide_signature',
        'fallback',
      },
    },

    appearance = {
      nerd_font_variant = 'mono',
    },

    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          max_width = 100,
          max_height = 30,
        },
      },
      menu = { max_height = 20 },
      accept = {
        -- experimental auto-brackets support
        auto_brackets = {
          enabled = false,
        },
      },
    },

    sources = {
      -- Remove 'buffer' if you don't want text completions, by default it's only enabled when LSP returns no items
      default = {
        'lsp',
        'path',
        'snippets',
        -- 'buffer',
        'lazydev',
        'emoji',
      },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        lsp = { async = true },
        emoji = {
          name = 'emoji',
          module = 'blink.compat.source',
          -- overwrite kind of suggestion
          transform_items = function(_, items)
            local kind = require('blink.cmp.types').CompletionItemKind.Text
            for i = 1, #items do
              items[i].kind = kind
            end
            return items
          end,
        },
      },
    },

    snippets = { preset = 'luasnip' },

    -- See :h blink-cmp-config-fuzzy for more information
    fuzzy = { implementation = 'prefer_rust_with_warning' },

    -- Shows a signature help window while you type arguments for a function
    signature = { enabled = true },
  },
}
