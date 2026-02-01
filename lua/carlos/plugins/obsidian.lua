return {
  'obsidian-nvim/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  -- ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    'BufReadPre '
      .. vim.fn.expand '~'
      .. '/carlos/obsidian-vaults/personal/**.md',
    'BufNewFile ' .. vim.fn.expand '~' .. '/carlos/obsidian-vaults/personal/**.md',
  },
  -- Uses:
  -- 'nvim-lua/plenary.nvim',
  dependencies = {
    'ibhagwan/fzf-lua',
    'nvim-treesitter/nvim-treesitter',
    'saghen/blink.cmp',
  },
  opts = {
    ui = {
      enable = false, -- disabling in favor of render-markdown.nvim
    },
    workspaces = {
      {
        name = 'carlos',
        path = '~/carlos/obsidian-vaults/personal/',
      },
    },
    -- Optional, completion of wiki links, local markdown links, and tags.
    completion = {
      -- Enables completion using nvim_cmp
      nvim_cmp = false,
      -- Enables completion using blink.cmp
      blink = true,
      -- Trigger completion at 2 chars.
      min_chars = 1,
    },
    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'mini.pick' or 'snacks.pick'.
      name = 'fzf-lua',
      -- Optional, configure key mappings for the picker. These are the defaults.
      -- Not all pickers support all mappings.
      note_mappings = {
        -- Create a new note from your query.
        new = '<C-x>',
        -- Insert a link to the selected note.
        insert_link = '<C-l>',
      },
      tag_mappings = {
        -- Add tag(s) to current note.
        tag_note = '<C-x>',
        -- Insert a tag at the current location.
        insert_tag = '<C-l>',
      },
    },
  },
  keys = {
    { '<leader>Ot', '<cmd>Obsidian today<cr>', desc = 'Obsidian Today' },
    { '<leader>Oy', '<cmd>Obsidian yesterday<cr>', desc = 'Obsidian Yesterday' },
  },
  config = function(_, opts)
    -- Disabling Obsidian's <CR> mapping to smart_action
    vim.api.nvim_create_autocmd('User', {
      pattern = 'ObsidianNoteEnter',
      callback = function()
        vim.keymap.del('n', '<CR>', { buffer = true })
      end,
    })

    require('obsidian').setup(opts)
  end,
}
