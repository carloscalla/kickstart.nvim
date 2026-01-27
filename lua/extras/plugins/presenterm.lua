return {
  'Piotr1215/presenterm.nvim',
  build = false, -- Disable rockspec/luarocks build
  dependencies = {
    'ibhagwan/fzf-lua',
  },
  opts = {
    default_keybindings = true,
    picker = {
      provider = 'fzf',
    },
  },
}
