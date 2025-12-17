return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  ---@type Flash.Config
  opts = {
    modes = {
      search = {
        enabled = false,
      },
      char = {
        enabled = true,
      },
    },
  },
  keys = {
    -- stylua: ignore start
    { "s"    , mode = { "n", "x" },      function() require("flash").jump() end,              desc = "Flash" },
    -- The following keymap doesn't work in tmux :(
    -- { "<C-,>", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
    { "<leader>ss", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,   desc = "Flash Treesitter" },
    { "r"    , mode = { "o" },           function() require("flash").remote() end,            desc = "Remote Flash" },
    { "R"    , mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    -- stylua: ignore end
    {
      's',
      mode = { 'o' },
      function()
        require('flash').jump {
          search = {
            forward = true,
            wrap = false,
            multi_window = false,
          },
          jump = {
            offset = -1,
          },
        }
      end,
      desc = 'Flash',
    },
    {
      'S',
      mode = { 'o' },
      function()
        require('flash').jump {
          search = {
            forward = false,
            wrap = false,
            multi_window = false,
          },
          jump = {
            inclusive = false,
          },
        }
      end,
      desc = 'Flash',
    },
  },
}
