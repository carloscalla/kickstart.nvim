return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- calling `setup` is optional for customization
    require('fzf-lua').setup {
      previewers = {
        builtin = {
          extensions = {
            ['png'] = { 'chafa', '{file}' },
            ['svg'] = { 'chafa', '{file}' },
            ['jpg'] = { 'chafa', '{file}' },
            ['gif'] = { 'chafa', '{file}' },
            -- ['png'] = { 'viu', '-b' },
            -- ['svg'] = { 'viu', '-b' },
            -- ['jpg'] = { 'viu', '-b' },
          },
        },
      },
      fzf_opts = { ['--layout'] = 'default' },
    }
  end,
}
