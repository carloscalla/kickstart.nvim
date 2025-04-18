return {}

--[[
return {
  'epwalsh/obsidian.nvim',
  enabled = false,
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
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    -- 'hrsh7th/nvim-cmp',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    workspaces = {
      {
        name = 'carlos',
        path = '~/carlos/obsidian-vaults/personal/',
      },
    },
  },
  keys = {
    { '<leader>Ot', '<cmd>ObsidianToday<cr>', desc = 'Obsidian Today' },
    { '<leader>Oy', '<cmd>ObsidianYesterday<cr>', desc = 'Obsidian Yesterday' },
  },
}
]]
