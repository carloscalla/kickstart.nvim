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
  -- stylua: ignore
  keys = {
    { "s"    , mode = { "n", "x" },      function() require("flash").jump() end,                          desc = "Flash" },
    { "s"    , mode = { "o" },           function() require("flash").jump { jump = { offset = -1 } } end, desc = "Flash" },
    { "<C-,>", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,         desc = "Flash Treesitter" },
    { "r"    , mode = { "o" },           function() require("flash").remote() end,                 desc = "Remote Flash" },
    { "R"    , mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,          desc = "Toggle Flash Search" },
  },
}
