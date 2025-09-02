return {
  'pwntester/octo.nvim',
  cmd = 'Octo',
  event = { { event = 'BufReadCmd', pattern = 'octo://*' } },
  -- Uses:
  -- 'nvim-lua/plenary.nvim',
  -- 'nvim-tree/nvim-web-devicons',
  dependencies = {
    'ibhagwan/fzf-lua',
  },
  config = function()
    require('octo').setup {
      -- picker = 'fzf-lua',
      picker = 'snacks',
      default_to_projects_v2 = true,
    }
  end,
  init = function()
    -- The following commands search PRs in the current repository.
    -- It searches for the current .git root directory
    -- To search for account wide PRs, use `:Octo search is:pr` command instead of `:Octo pr search`.
    vim.api.nvim_create_user_command('GhPrToTeam', function()
      vim.cmd [[ Octo pr search is:open review-requested:@me ]]
    end, { desc = 'Github open PRs assigned to me or my team' })

    vim.api.nvim_create_user_command('GhPrToMe', function()
      vim.cmd [[ Octo pr search is:open user-review-requested:@me ]]
    end, { desc = 'Github open PRs assigned to me' })

    vim.api.nvim_create_user_command('GhPrByMe', function()
      vim.cmd [[ Octo pr search is:open author:@me ]]
    end, { desc = 'Github open PRs created by me' })

    vim.api.nvim_create_user_command('GhPrInvolvesMe', function()
      vim.cmd [[ Octo pr search is:open involves:@me -author:@me ]]
    end, { desc = 'Github PRs involving me' })
  end,
}
