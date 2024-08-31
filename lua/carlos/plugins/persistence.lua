return {
  'folke/persistence.nvim',
  event = 'BufReadPre',
  opts = {
    dir = vim.fn.expand(vim.fn.stdpath 'state' .. '/sessions/'), -- directory where session files are saved
    options = { 'buffers', 'curdir', 'tabpages', 'winsize' }, -- sessionoptions used for saving
    pre_save = nil, -- a function to call before saving the session
    save_empty = false, -- don't save if there are no open file buffers
  },
  init = function()
    vim.api.nvim_create_user_command('PersistenceRestoreCwd', function()
      require('persistence').load()
    end, {
      desc = 'Restore the session for the current directory',
    })

    vim.api.nvim_create_user_command('PersistenceRestoreLast', function()
      require('persistence').load { last = true }
    end, {
      desc = 'Restore the last session',
    })

    vim.api.nvim_create_user_command('PersistenceStop', function()
      require('persistence').stop()
    end, {
      desc = "Stop Persistence => session won't be saved on exit",
    })
  end,
}
