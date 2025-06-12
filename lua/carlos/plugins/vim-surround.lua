return {
  'tpope/vim-surround',
  init = function()
    -- Disable vim-surround default mappings
    vim.g.surround_no_mappings = true
  end,
  config = function()
    local function map(mode, l, r, opts)
      vim.keymap.set(mode, l, r, opts)
    end

    -- Test with gs prefix
    -- map('n', 'gsd', '<Plug>Dsurround')
    -- map('n', 'gsc', '<Plug>Csurround')
    -- map('n', 'gsC', '<Plug>CSurround')
    -- map('n', 'gsy', '<Plug>Ysurround')
    -- map('n', 'gsY', '<Plug>YSurround')
    -- map('n', 'gsyy', '<Plug>Yssurround')
    -- map('n', 'gsYy', '<Plug>YSsurround')
    -- map('n', 'gsYY', '<Plug>YSsurround')
    -- map('x', 'S', '<Plug>VSurround')
    -- map('x', 'gS', '<Plug>VgSurround')

    -- Defaults
    -- nmap ds  <Plug>Dsurround
    -- nmap cs  <Plug>Csurround
    -- nmap cS  <Plug>CSurround
    -- nmap ys  <Plug>Ysurround
    -- nmap yS  <Plug>YSurround
    -- nmap yss <Plug>Yssurround
    -- nmap ySs <Plug>YSsurround
    -- nmap ySS <Plug>YSsurround
    -- xmap S   <Plug>VSurround
    -- xmap gS  <Plug>VgSurround
    -- imap <C-S> <Plug>Isurround
    -- imap <C-G>s <Plug>Isurround
    -- imap <C-G>S <Plug>ISurround

    map('n', '<leader>ds', '<Plug>Dsurround', { desc = 'Delete surrounding' })
    map('n', '<leader>cs', '<Plug>Csurround', { desc = 'Change surrounding' })
    map('n', '<leader>cS', '<Plug>CSurround', { desc = 'Change surrounding (new line)' })
    map('n', '<leader>ys', '<Plug>Ysurround', { desc = 'Add surrounding' })
    map('n', '<leader>yS', '<Plug>YSurround', { desc = 'Add surrounding (new line)' })
    map('n', '<leader>yss', '<Plug>Yssurround', { desc = 'Add line surrounding' })
    map('n', '<leader>ySs', '<Plug>YSsurround', { desc = 'Add line surrounding (new line)' })
    map('n', '<leader>ySS', '<Plug>YSsurround', { desc = 'Add line surrounding (new line)' })
    map('x', '<leader>S', '<Plug>VSurround', { desc = 'Visual mode surround' })
    map('x', '<leader>gS', '<Plug>VgSurround', { desc = 'Visual mode surround' })
    -- map('i', '<C-S>', '<Plug>Isurround')
    -- map('i', '<C-G>s', '<Plug>Isurround')
    -- map('i', '<C-G>S', '<Plug>ISurround')
  end,
}
