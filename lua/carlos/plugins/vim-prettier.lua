return {
  'prettier/vim-prettier',
  enabled = false,
  build = 'yarn install --frozen-lockfile --production',
  keys = {
    { '<leader>pp', '<Plug>(PrettierAsync)', desc = 'Prettier: Format file' },
  },
}
