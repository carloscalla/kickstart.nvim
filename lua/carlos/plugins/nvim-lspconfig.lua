return { -- Main LSP Configuration
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    -- Mason must be loaded before its dependents so we need to set it up here.
    -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
    { 'williamboman/mason.nvim', opts = {} },
    -- { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- Useful status updates for LSP.
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', opts = {} },

    -- Allows extra capabilities provided by nvim-cmp
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        --  To jump back, press <C-t>.
        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('<leader>gd', function()
          require('fzf-lua').lsp_definitions {
            winopts = {
              height = 0.7,
              width = 0.6,
              preview = {
                layout = 'vertical',
                vertical = 'up:70%',
              },
            },
          }
        end, '[G]oto [D]efinition')

        -- Find references for the word under your cursor.
        map('<leader>gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('gr', function()
          require('fzf-lua').lsp_references {
            winopts = {
              width = 0.7,
              preview = {
                layout = 'vertical',
                vertical = 'up:55%',
              },
            },
          }
        end, '[G]oto [R]eferences')

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('<leader>gI', require('fzf-lua').lsp_implementations, '[G]oto [I]mplementation')

        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

        -- Fuzzy find all the symbols in your current document.
        --  Symbols are things like variables, functions, types, etc.
        map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

        -- Fuzzy find all the symbols in your current workspace.
        --  Similar to document symbols, except searches over your entire project.
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        -- Rename the variable under your cursor.
        --  Most Language Servers support renaming across files, etc.
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

        -- Opens a popup that displays documentation about the word under your cursor
        --  See `:help K` for why this keymap.
        map('K', vim.lsp.buf.hover, 'Hover Documentation')

        map('gK', vim.lsp.buf.signature_help, 'Signature help')

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        -- The following code creates a keymap to toggle inlay hints in your
        -- code, if the language server you are using supports them
        --
        -- This may be unwanted, since they displace some of your code
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    -- Change diagnostic symbols in the sign column (gutter)
    -- if vim.g.have_nerd_font then
    --   local signs = { ERROR = '', WARN = '', INFO = '', HINT = '' }
    --   local diagnostic_signs = {}
    --   for type, icon in pairs(signs) do
    --     diagnostic_signs[vim.diagnostic.severity[type]] = icon
    --   end
    --   vim.diagnostic.config { signs = { text = diagnostic_signs } }
    -- end

    -- LSP servers and clients are able to communicate to each other what features they support.
    --  By default, Neovim doesn't support everything that is in the LSP specification.
    --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
    --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    -- Enable the following language servers
    --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
    --
    --  Add any additional override configuration in the following tables. Available keys are:
    --  - cmd (table): Override the default command used to start the server
    --  - filetypes (table): Override the default list of associated filetypes for the server
    --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
    --  - settings (table): Override the default settings passed when initializing the server.
    --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
    local servers_config = {
      -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
      --
      -- Some languages (like typescript) have entire language plugins that can be useful:
      --    https://github.com/pmizio/typescript-tools.nvim
      --
      -- But for many setups, the LSP (`ts_ls`) will work just fine
      ts_ls = {
        -- Disabling ts_ls in favor of vtsls
        enabled = false,
        -- Default
        -- root_dir = root_pattern('tsconfig.json', 'jsconfig.json', 'package.json', '.git'),

        -- From folke dot files
        -- root_dir = function(...)
        --   return require('lspconfig.util').root_pattern '.git'(...)
        -- end,

        -- Set the root directory for the LSP to be the root of the git repository (priority if exists) to avoid running multiple processes
        root_dir = function(...)
          return require('lspconfig.util').root_pattern('.git', 'tsconfig.json', 'jsconfig.json', 'package.json')(...)
        end,
        on_attach = function(client, bufnr)
          vim.keymap.set('n', '<leader>cR', function()
            vim.lsp.buf.code_action {
              apply = true,
              context = {
                only = { 'source.removeUnused.ts' },
                diagnostics = {},
              },
            }
          end, { buffer = bufnr, desc = 'Remove Unused Imports' })

          vim.keymap.set('n', '<leader>cM', function()
            vim.lsp.buf.code_action {
              apply = true,
              context = {
                only = { 'source.addMissingImports.ts' },
                diagnostics = {},
              },
            }
          end, { buffer = bufnr, desc = 'Add missing imports' })
        end,
        settings = {
          completions = {
            completeFunctionCalls = true,
          },
        },
      },

      vtsls = {
        -- Set the root directory for the LSP to be the root of the git repository (priority if exists) to avoid running multiple processes
        root_dir = function(...)
          return require('lspconfig.util').root_pattern('.git', 'tsconfig.json', 'jsconfig.json', 'package.json')(...)
        end,

        on_attach = function(client, bufnr)
          vim.keymap.set('n', '<leader>cR', function()
            vim.lsp.buf.code_action {
              apply = true,
              context = {
                only = { 'source.removeUnused.ts' },
                diagnostics = {},
              },
            }
          end, { buffer = bufnr, desc = 'Remove Unused Imports' })

          vim.keymap.set('n', '<leader>cM', function()
            vim.lsp.buf.code_action {
              apply = true,
              context = {
                only = { 'source.addMissingImports.ts' },
                diagnostics = {},
              },
            }
          end, { buffer = bufnr, desc = 'Add missing imports' })

          vim.keymap.set({ 'n', 'x' }, '<leader>cA', function()
            vim.lsp.buf.code_action {
              apply = true,
              context = {
                only = { 'source' },
                diagnostics = {},
              },
            }
          end, { buffer = bufnr, desc = 'Source Action' })
        end,

        settings = {
          complete_function_calls = true,
          vtsls = {
            enableMoveToFileCodeAction = true,
            autoUseWorkspaceTsdk = true,
            experimental = {
              completion = {
                enableServerSideFuzzyMatch = true,
              },
            },
          },
          typescript = {
            updateImportsOnFileMove = { enabled = 'always' },
            suggest = {
              completeFunctionCalls = true,
            },
            inlayHints = {
              enumMemberValues = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              parameterNames = { enabled = 'literals' },
              parameterTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              variableTypes = { enabled = true },
            },
          },
          javascript = {
            updateImportsOnFileMove = { enabled = 'always' },
            suggest = {
              completeFunctionCalls = true,
            },
            inlayHints = {
              enumMemberValues = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              parameterNames = { enabled = 'literals' },
              parameterTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              variableTypes = { enabled = true },
            },
          },
        },
      },

      lua_ls = {
        -- cmd = { ... },
        -- filetypes = { ... },
        -- capabilities = {},
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            codeLens = {
              enable = true,
            },
            completion = {
              callSnippet = 'Replace',
            },
            doc = {
              privateName = { '^_' },
            },
            hint = {
              enable = true,
              setType = false,
              paramType = true,
              paramName = 'Disable',
              semicolon = 'Disable',
              arrayIndex = 'Disable',
            },
            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            -- diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },

      eslint = {
        settings = {
          -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
          workingDirectories = { mode = 'auto' },
        },
        on_attach = function(client, bufnr)
          vim.keymap.set('n', '<leader>co', '<cmd>EslintFixAll<cr>', { buffer = bufnr, desc = 'Organize Imports' })
          -- vim.api.nvim_create_autocmd('BufWritePre', {
          --   buffer = bufnr,
          --   command = 'EslintFixAll',
          -- })
        end,
      },

      ruff = {
        cmd_env = { RUFF_TRACE = 'messages' },
        init_options = {
          settings = {
            logLevel = 'error',
          },
        },
        on_attach = function(client, bufnr)
          client.server_capabilities.hoverProvider = false
          vim.keymap.set('n', '<leader>co', function()
            vim.lsp.buf.code_action {
              apply = true,
              context = {
                only = { 'source.organizeImports' },
                diagnostics = {},
              },
            }
          end, { buffer = bufnr, desc = 'Format' })
        end,
      },
    }

    -- Ensure the servers and tools above are installed
    --
    -- To check the current status of installed tools and/or manually install
    -- other tools, you can run  :Mason
    --

    -- Ensure the following LSPs are installed
    local ensure_installed = {
      'clangd',
      'gopls',
      'rust_analyzer',
      -- 'ts_ls',
      'vtsls',
      'lua_ls',
      'eslint',
      'cssls',
      'jsonls',
      'html',
      'vimls',
      'yamlls',
      'bashls',
      'dockerls',
      'pyright',
      'ruff',
    }

    -- You can press `g?` for help in this menu.
    -- require('mason').setup()
    --
    -- `mason` had to be setup earlier: to configure its options see the
    -- `dependencies` table for `nvim-lspconfig` above.
    --
    -- You can add other tools here that you want Mason to install
    -- for you, so that they are available from within Neovim.
    -- local ensure_installed = vim.tbl_keys(servers or {})

    vim.list_extend(ensure_installed, {
      'stylua', -- Used to format Lua code
      'prettierd',
      'prettier',
      'ktlint',
      'markdownlint',
      'goimports',
      'gofumpt',
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers_config[server_name] or {}
          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for ts_ls)
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }

    -- Set up the LSP for vtsls
    -- require('lspconfig.configs').vtsls = require('vtsls').lspconfig -- set default server config, optional but recommended

    -- If the lsp setup is taken over by other plugin, it is the same to call the counterpart setup function
    -- require('lspconfig').vtsls.setup { --[[ your custom server config here ]] }
  end,
}
