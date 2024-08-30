return {
  'pwntester/octo.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- 'nvim-telescope/telescope.nvim',
    'ibhagwan/fzf-lua',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('octo').setup {
      -- FzF-lua throwing errors, specially with `search` command
      -- picker = 'fzf-lua',
      {
        suppress_missing_scope = {
          projects_v2 = true,
        },
      },

      vim.api.nvim_create_user_command('GhPrTeam', function()
        vim.cmd [[ Octo pr search is:open review-requested:@me ]]
      end, { desc = 'Github PRs assigned to me or my team' }),

      vim.api.nvim_create_user_command('GhPrMe', function()
        vim.cmd [[ Octo pr search is:open user-review-requested:@me ]]
      end, { desc = 'Github PRs assigned to me' }),
    }
  end,
}
