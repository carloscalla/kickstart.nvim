return {
  'stevearc/overseer.nvim',
  cmd = { 'OverseerRun' },
  opts = {
    task_list = {
      max_height = 30,
      min_height = 15,
      bindings = {
        ['<C-h>'] = false,
        ['<C-j>'] = false,
        ['<C-u>'] = 'ScrollOutputUp',
        ['<C-d>'] = 'ScrollOutputDown',
      },
    },
  },
  keys = {
    {
      '<leader>or',
      function()
        require('overseer').run_task()
      end,
      desc = 'Overseer: Open',
    },
    {
      '<leader>ot',
      function()
        require('overseer').toggle()
      end,
      desc = 'Overseer: Toggle',
    },
  },
}
