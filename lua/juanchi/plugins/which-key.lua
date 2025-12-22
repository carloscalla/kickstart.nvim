return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    ---@type false | "classic" | "modern" | "helix"
    preset = 'helix',
    ---@type number | fun(ctx: { keys: string, mode: string, plugin?: string }):number
    delay = function(ctx)
      return ctx.plugin and 0 or 300
    end,
    spec = {
      { '<leader>O', group = 'Obsidian' },
      { '<leader>a', group = 'Avante' },
      { '<leader>f', group = 'FzfLua' },
      { '<leader>g', group = 'Git/GrugFar' },
      { '<leader>h', group = 'Harpoon' },
      { '<leader>n', group = 'Tree/Neogit' },
      { '<leader>o', group = 'Oil/Overseer' },
      { '<leader>s', group = 'Search/Snacks' },
      { '<leader>t', group = 'Toggle/Test/Terminal' },
      { '<leader>w', group = 'Window' },
    },
    icons = {
      mappings = vim.g.have_nerd_font,
      keys = vim.g.have_nerd_font and {} or {
        Up = '<Up> ',
        Down = '<Down> ',
        Left = '<Left> ',
        Right = '<Right> ',
        C = '<C-…> ',
        M = '<M-…> ',
        D = '<D-…> ',
        S = '<S-…> ',
        CR = '<CR> ',
        Esc = '<Esc> ',
        ScrollWheelDown = '<ScrollWheelDown> ',
        ScrollWheelUp = '<ScrollWheelUp> ',
        NL = '<NL> ',
        BS = '<BS> ',
        Space = '<Space> ',
        Tab = '<Tab> ',
        F1 = '<F1>',
        F2 = '<F2>',
        F3 = '<F3>',
        F4 = '<F4>',
        F5 = '<F5>',
        F6 = '<F6>',
        F7 = '<F7>',
        F8 = '<F8>',
        F9 = '<F9>',
        F10 = '<F10>',
        F11 = '<F11>',
        F12 = '<F12>',
      },
    },
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show { global = false }
      end,
      desc = 'Buffer local keymaps (which-key)',
    },
  },
}
