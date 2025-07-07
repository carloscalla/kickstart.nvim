return {
  'leath-dub/snipe.nvim',
  opts = {
    ui = {
      ---@type "topleft"|"bottomleft"|"topright"|"bottomright"|"center"|"cursor"
      position = 'center',

      ---@type boolean
      preselect_current = true,

      ---@type "left"|"right"|"file-first"
      text_align = 'file-first',
    },
    navigate = {
      open_vsplit = 'V',
      open_split = 'S',
    },
  },
  keys = {
    {
      '<leader>so',
      function()
        require('snipe').open_buffer_menu()
      end,
      desc = 'Open Snipe buffer menu',
    },
  },
}
