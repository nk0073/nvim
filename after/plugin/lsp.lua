-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    vim.keymap.set('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
  end,
})

local cmp = require('cmp')

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- Ensure snippets work
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)  -- Use luasnip instead of vim.snippet
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  }),
})

local lspconfig = require('lspconfig')

-- Ensure servers are installed (using mason.nvim)
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = {
    'clangd', -- C/C++
    'jdtls', -- Java
    'pyright', -- Python
    'lua_ls', -- Lua
    'rust_analyzer', -- Rust
  },
}

-- Setup servers
mason_lspconfig.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }, -- Prevent errors on "vim" global
          },
          workspace = {
            checkThirdParty = false, -- Prevent unnecessary prompts
          },
          telemetry = { enable = false },
        }
      }
    }
  end,

  -- Special config for clangd
    ['clangd'] = function()
      local cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=never",
        "--log=verbose",
        "--all-scopes-completion",
        "--completion-style=detailed",
        "--pch-storage=memory",
      }
      -- Add Windows-specific options only on Windows
      if vim.loop.os_uname().sysname == "Windows_NT" then
        table.insert(cmd, "--query-driver=C:/msys64/ucrt64/bin/gcc.exe")
      end
      lspconfig.clangd.setup {
        cmd = cmd,
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      }
    end,

  ['jdtls'] = function()
    lspconfig.jdtls.setup {
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }
  end,

  ['pyright'] = function()
    lspconfig.pyright.setup {
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }
  end
}

