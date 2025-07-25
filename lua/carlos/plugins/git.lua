-- Git related plugins

local _is_diffview_open = function()
  return package.loaded.diffview and require('diffview.lib').get_current_view()
end

local _toggle_diffview = function()
  if _is_diffview_open() then
    vim.cmd 'DiffviewClose'
  else
    vim.cmd 'DiffviewOpen'
  end
end

return {
  {
    'tpope/vim-fugitive',
    cmd = {
      'Git',
      'G',
      'Gdiffsplit',
      'Gvdiffsplit',
      'Gedit',
      'Gsplit',
      'Gread',
      'Gwrite',
      'GDelete',
      'GRemove',
      'GMove',
      'GRename',
      'Ggrep',
      'Glgrep',
      'GBrowse',
    },
    dependencies = {
      'tpope/vim-rhubarb', -- Adds GitHub support to fugitive
    },
    keys = {
      { '<leader>gg', '<cmd>Git<cr>', desc = 'Git' },
    },
  },
  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
    keys = {
      {
        '<leader>gd',
        function()
          _toggle_diffview()
        end,
        desc = 'Diffview toggle',
      },
    },
  },
  {
    'lewis6991/gitsigns.nvim', -- Adds git related signs to the gutter, as well as utilities for managing changes
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500,
      },
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']g', function()
          if vim.wo.diff then
            vim.cmd.normal { ']g', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Jump to next git change' })

        map('n', '[g', function()
          if vim.wo.diff then
            vim.cmd.normal { '[g', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Jump to previous git change' })

        -- Actions
        -- visual mode
        map('v', '<leader>hs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'Git: hunk stage' })

        map('v', '<leader>hr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'Git: hunk reset' })

        -- normal mode
        map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Git: Hunk stage/unstage' })
        map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Git: Hunk reset' })
        map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Git: Stage buffer' })
        map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Git: Reset buffer' })
        map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Git: Preview hunk' })
        map('n', '<leader>hP', gitsigns.preview_hunk_inline, { desc = 'Git: Preview hunk inline' })
        map('n', '<leader>hb', function()
          gitsigns.blame_line { full = true }
        end, { desc = 'Git: Blame line' })
        map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Git: Diff against index' })
        map('n', '<leader>hD', function()
          gitsigns.diffthis '~'
        end, { desc = 'Git: Diff against last commit' })
        -- Toggles
        -- map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })

        -- Text object
        map({ 'o', 'x' }, 'ah', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Git: Hunk textobject' })
      end,
    },
  },
  {
    'NeogitOrg/neogit',
    -- enabled = false,
    cmd = 'Neogit',
    -- Uses:
    -- 'nvim-lua/plenary.nvim', -- required
    dependencies = {
      'sindrets/diffview.nvim', -- optional - Diff integration
      'ibhagwan/fzf-lua', -- optional
    },
    opts = {
      kind = 'floating',
      commit_editor = {
        staged_diff_split_kind = 'split_above',
      },
    },
    keys = {
      { '<leader>ng', '<cmd>Neogit<cr>', desc = 'Neogit' },
    },
  },
}
