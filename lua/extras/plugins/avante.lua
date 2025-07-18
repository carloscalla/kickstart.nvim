return {
  {
    'yetone/avante.nvim',
    build = 'make',
    event = 'VeryLazy',
    -- lazy = true,
    version = false, -- Never set this value to "*"! Never!
    opts = {
      provider = 'copilot',
      providers = {
        copilot = {
          model = 'claude-sonnet-4',
        },
      },
      windows = {
        ask = {
          start_insert = false,
        },
      },
    },
    -- Uses:
    -- 'nvim-tree/nvim-web-devicons',
    -- 'nvim-lua/plenary.nvim',
    -- 'MunifTanjim/nui.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      --- The below dependencies are optional,
      'folke/snacks.nvim', -- for input provider snacks

      -- for providers='copilot'
      -- include any of the ones below in your custom config
      -- If you face any problem in the loading order of the plugins, uncomment the one
      -- you are using in this dependency list below

      -- 'zbirenbaum/copilot.lua',
      -- 'github/copilot.vim',
      {
        -- support for image pasting
        'HakonHarnes/img-clip.nvim',
        -- event = 'VeryLazy',
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
    },
    -- keys = {
    --   {
    --     '<leader>aa',
    --     '<Cmd>AvanteAsk<CR>',
    --     desc = 'avante: ask',
    --     mode = { 'n', 'v' },
    --   },
    --   {
    --     '<leader>ae',
    --     '<Cmd>AvanteEdit<CR>',
    --     desc = 'avante: edit',
    --     mode = { 'v' },
    --   },
    -- },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'Avante' },
    opts = {
      file_types = { 'Avante' },
    },
  },
  {
    'saghen/blink.cmp',
    dependencies = {
      'Kaiser-Yang/blink-cmp-avante',
    },
    opts = {
      -- options for blink-cmp-avante
      sources = {
        default = { 'avante' },
        providers = {
          avante = {
            module = 'blink-cmp-avante',
            name = 'Avante',
            opts = {
              -- options for blink-cmp-avante
            },
          },
        },
      },
    },
  },
}
