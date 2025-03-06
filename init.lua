--[[

=====================================================================
=====================================================================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.
--]]

require 'carlos.options'

require 'carlos.keymaps'

require 'carlos.autocmds'

require 'carlos.usercmds'

require 'carlos.lazy-bootstrap'

require 'carlos.lazy-plugins'

-- Up to date with:
-- https://github.com/nvim-lua/kickstart.nvim/commit/34e7d29aa7b6e95cf09d62baf4c9082db5b129c0

-- Except (all related to which key which I don't use):
-- https://github.com/nvim-lua/kickstart.nvim/commit/ac78e7d9e77048fa7d5b0711f85aab93508e71a7
-- https://github.com/nvim-lua/kickstart.nvim/commit/24d368f9ff3a951f9760c3c0e776a52726401f4f
-- https://github.com/nvim-lua/kickstart.nvim/commit/a22976111e406ec0e4903ae78bf66a1fc0125b8a
-- https://github.com/nvim-lua/kickstart.nvim/commit/7201dc480134f41dd1be1f8f9b8f8470aac82a3b
-- https://github.com/nvim-lua/kickstart.nvim/commit/8d1ef972bc32faa86fee21a57f9033b41f612ebb
-- https://github.com/nvim-lua/kickstart.nvim/commit/bcdb4cd2525d517864b8221ddce3c5652ac35f9e
-- https://github.com/nvim-lua/kickstart.nvim/commit/a8f539562a8c5d822dd5c0ca1803d963c60ad544
--
-- https://github.com/nvim-lua/kickstart.nvim/commit/abdbfce0f8610e8661ccf27c1ba13b8134b78673

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
