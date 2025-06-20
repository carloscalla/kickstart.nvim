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
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional,
      'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
      'folke/snacks.nvim', -- for input provider snacks
      'zbirenbaum/copilot.lua', -- for providers='copilot'
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
