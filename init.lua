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
-- https://github.com/nvim-lua/kickstart.nvim/commit/4120893b8a1f31a0957f2f891f7fbef73ddfb9b1

-- Except (all related to which key which I don't use):
-- https://github.com/nvim-lua/kickstart.nvim/commit/ac78e7d9e77048fa7d5b0711f85aab93508e71a7
-- https://github.com/nvim-lua/kickstart.nvim/commit/24d368f9ff3a951f9760c3c0e776a52726401f4f
-- https://github.com/nvim-lua/kickstart.nvim/commit/a22976111e406ec0e4903ae78bf66a1fc0125b8a
-- https://github.com/nvim-lua/kickstart.nvim/commit/7201dc480134f41dd1be1f8f9b8f8470aac82a3b

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
