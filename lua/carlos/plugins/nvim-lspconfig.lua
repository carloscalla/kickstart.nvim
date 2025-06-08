return { -- Main LSP Configuration
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    -- Mason must be loaded before its dependents so we need to set it up here.
    { 'mason-org/mason.nvim', opts = {} },
    { 'mason-org/mason-lspconfig.nvim' },
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- Useful status updates for LSP.
    { 'j-hui/fidget.nvim', opts = {} },

    -- Allows extra capabilities provided by blink.cmp
    'saghen/blink.cmp',
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('neoBim-lsp-attach', { clear = true }),
      callback = function(event)
        require('carlos.plugins.conform')._set_gq_keymap(event)

        local client = vim.lsp.get_client_by_id(event.data.client_id)

        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        if client and client.name == 'eslint' then
          map('<leader>co', function()
            local cur_bufnr = vim.api.nvim_get_current_buf()

            client:exec_cmd({
              title = 'Fix all Eslint errors for current buffer',
              command = 'eslint.applyAllFixes',
              arguments = {
                {
                  uri = vim.uri_from_bufnr(cur_bufnr),
                  version = vim.lsp.util.buf_versions[cur_bufnr],
                },
              },
            }, { bufnr = cur_bufnr })
          end, 'EsLint: Fix all')
        end

        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        --  To jump back, press <C-t>.
        map('gd', function()
          require('fzf-lua').lsp_definitions {
            winopts = {
              height = 0.7,
              -- width = 0.6,
              width = 150,
              preview = {
                layout = 'vertical',
                vertical = 'up:70%',
              },
            },
          }
        end, '[G]oto [D]efinition')
        map('gD', function()
          require('fzf-lua').lsp_definitions {
            jump1 = false,
            winopts = {
              height = 0.7,
              -- width = 0.6,
              width = 150,
              preview = {
                layout = 'vertical',
                vertical = 'up:70%',
              },
            },
          }
        end, 'Preview Definition')

        -- Find references for the word under your cursor.
        map('grr', function()
          require('fzf-lua').lsp_references {
            winopts = {
              -- width = 0.75,
              width = 170,
              preview = {
                layout = 'vertical',
                vertical = 'up:55%',
              },
            },
          }
        end, '[G]oto [R]eferences')

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        map('gri', require('fzf-lua').lsp_implementations, 'Goto Implementation')

        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        map('grt', require('fzf-lua').lsp_typedefs, 'Type Definition')

        -- Fuzzy find all the symbols in your current document.
        --  Symbols are things like variables, functions, types, etc.
        map('<leader>fs', require('fzf-lua').lsp_document_symbols, 'Document Symbols')

        -- Fuzzy find all the symbols in your current workspace.
        --  Similar to document symbols, except searches over your entire project.
        map('<leader>fS', require('fzf-lua').lsp_live_workspace_symbols, 'Workspace Symbols')

        -- Rename the variable under your cursor.
        --  Most Language Servers support renaming across files, etc.
        map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        -- map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
        map('<leader>ca', function()
          require('fzf-lua').lsp_code_actions {
            winopts = {
              height = 0.65,
              width = 120,
              preview = {
                layout = 'vertical',
                vertical = 'down:65%',
                -- hidden = 'hidden',
              },
            },
          }
        end, 'LSP Code Actions', { 'n', 'x' })

        -- Opens a popup that displays documentation about the word under your cursor
        --  See `:help K` for why this keymap.
        map('K', function()
          vim.lsp.buf.hover { border = 'single' }
        end, 'Hover Documentation')

        map('gK', function()
          vim.lsp.buf.signature_help { border = 'single' }
        end, 'Signature help')

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.
        map('grD', vim.lsp.buf.declaration, 'Goto Declaration')

        -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
        ---@param client vim.lsp.Client
        ---@param method vim.lsp.protocol.Method
        ---@param bufnr? integer some lsp support methods only in specific files
        ---@return boolean
        local function client_supports_method(client, method, bufnr)
          if vim.fn.has 'nvim-0.11' == 1 then
            return client:supports_method(method, bufnr)
          else
            return client.supports_method(method, { bufnr = bufnr })
          end
        end

        -- The next block is replaced by vim-illuminate
        -- Leaving it commented out in case I want to switch back

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        -- if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
        --   local highlight_augroup = vim.api.nvim_create_augroup('neoBim-lsp-highlight', { clear = false })
        --   vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        --     buffer = event.buf,
        --     group = highlight_augroup,
        --     callback = vim.lsp.buf.document_highlight,
        --   })
        --
        --   vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        --     buffer = event.buf,
        --     group = highlight_augroup,
        --     callback = vim.lsp.buf.clear_references,
        --   })
        --
        --   vim.api.nvim_create_autocmd('LspDetach', {
        --     group = vim.api.nvim_create_augroup('neoBim-lsp-detach', { clear = true }),
        --     callback = function(event2)
        --       vim.lsp.buf.clear_references()
        --       vim.api.nvim_clear_autocmds { group = 'neoBim-lsp-highlight', buffer = event2.buf }
        --     end,
        --   })
        -- end

        -- The following code creates a keymap to toggle inlay hints in your
        -- code, if the language server you are using supports them
        --
        -- This may be unwanted, since they displace some of your code
        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    -- Diagnostic Config
    -- See :help vim.diagnostic.Opts
    vim.diagnostic.config {
      severity_sort = true,
      float = { border = 'single', source = 'if_many' },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      } or {},
      virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function(diagnostic)
          local diagnostic_message = {
            [vim.diagnostic.severity.ERROR] = diagnostic.message,
            [vim.diagnostic.severity.WARN] = diagnostic.message,
            [vim.diagnostic.severity.INFO] = diagnostic.message,
            [vim.diagnostic.severity.HINT] = diagnostic.message,
          }
          return diagnostic_message[diagnostic.severity]
        end,
      },
    }

    -- LSP servers and clients are able to communicate to each other what features they support.
    --  By default, Neovim doesn't support everything that is in the LSP specification.

    -- When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
    -- So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
    local capabilities = require('blink.cmp').get_lsp_capabilities()

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

      vtsls = {
        -- Set the root directory for the LSP to be the root of the git repository (priority if exists) to avoid running multiple processes
        root_dir = function(bufnr, cb)
          local lsp_root_dir = require('lspconfig.util').root_pattern('.git', 'tsconfig.json', 'package.json', 'jsconfig.json')(vim.fn.expand '%:p')
          cb(lsp_root_dir)
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
              -- maxInlayHintLength = 30,
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
          end, { buffer = bufnr, desc = 'Organize Imports' })
        end,
      },
    }

    -- Ensure the servers and tools above are installed
    --
    -- To check the current status of installed tools and/or manually install
    -- other tools, you can run  :Mason
    --

    -- Ensure the following LSPs are installed
    local lsp = {
      'clangd',
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
      'kotlin_language_server',
    }

    if vim.fn.executable 'go' == 1 then
      table.insert(lsp, 'gopls')
    end

    local ensure_installed = vim.tbl_values(lsp)

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
    })

    if vim.fn.executable 'go' == 1 then
      table.insert(ensure_installed, 'goimports')
      table.insert(ensure_installed, 'gofumpt')
    end

    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      automatic_enable = lsp,
      ensure_installed = {}, -- explicitly set to an empty table (neoBim populates installs via mason-tool-installer)
    }

    for _, server in ipairs(lsp) do
      local config = servers_config[server]

      if config then
        config.capabilities = vim.tbl_deep_extend('force', {}, capabilities, config.capabilities or {})
        vim.lsp.config(server, config)
      else
        -- If the server is not in the config, just set the capabilities
        vim.lsp.config(server, {
          capabilities = capabilities,
        })
      end
    end

    -- Done by mason-lspconfig
    -- vim.lsp.enable(lsp)
  end,
}
