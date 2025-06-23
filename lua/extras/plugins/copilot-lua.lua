return {
  'zbirenbaum/copilot.lua',
  opts = {
    panel = {
      enabled = true,
      auto_refresh = false,
      keymap = {
        jump_prev = '[[',
        jump_next = ']]',
        accept = '<CR>',
        refresh = 'gr',
        open = '<M-CR>',
      },
      layout = {
        position = 'bottom', -- | top | left | right | horizontal | vertical
        ratio = 0.4,
      },
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      hide_during_completion = false,
      debounce = 75,
      trigger_on_accept = true,
      keymap = {
        accept = '<C-j>',
        accept_word = false,
        accept_line = false,
        next = '<M-]>',
        prev = '<M-[>',
        dismiss = '<C-]>',
      },
    },
    -- copilot_model = 'claude-sonnet-4', -- this doesn't seem to be working yet
    filetypes = {
      -- I need to review this because it attaches to empty buffers and I'm not
      -- sure if I want to trigger LspAttach on VimEnter
      ['*'] = true,
    },
  },
}
