return {
  'pwntester/octo.nvim',
  cmd = 'Octo',
  event = { { event = 'BufReadCmd', pattern = 'octo://*' } },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    -- 'ibhagwan/fzf-lua',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('octo').setup {
      -- FzF-lua throwing errors, specially with `search` command
      picker = 'fzf-lua',
      -- picker = 'snacks',
      -- picker = 'telescope',
      default_to_projects_v2 = true,
    }
  end,
  init = function()
    vim.api.nvim_create_user_command('GhPrToTeam', function()
      vim.cmd [[ Octo search is:pr is:open review-requested:@me ]]
    end, { desc = 'Github open PRs assigned to me or my team' })

    vim.api.nvim_create_user_command('GhPrToMe', function()
      vim.cmd [[ Octo search is:pr is:open user-review-requested:@me ]]
    end, { desc = 'Github open PRs assigned to me' })

    vim.api.nvim_create_user_command('GhPrByMe', function()
      vim.cmd [[ Octo search is:pr is:open author:@me ]]
    end, { desc = 'Github open PRs created by me' })

    vim.api.nvim_create_user_command('GhPrInvolvesMe', function()
      vim.cmd [[ Octo search is:pr is:open involves:@me -author:@me ]]
    end, { desc = 'Github PRs involving me' })
  end,
}
