--- Configuration for LSP, formatters, and linters.
local nvim_lsp = require("lspconfig")
local saga = require("lspsaga")
local protocol = require'vim.lsp.protocol'

-- Completion setup _---------------
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  --buf_set_keymap('n', '<C-j>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<S-C-j>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  -- format On-Save
  if client.resolved_capabilities.document_formatting then
  vim.api.nvim_exec([[
  augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.py,*.js,*.jsx,*.rs,*.lua,*.php,*.html,*.blade,*.json FormatWrite
  augroup END
  ]], true)
  end
   --protocol.SymbolKind = { }
  protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
  }
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
capabilities.textDocument.completion.completionItem.snippetSupport = true
---------------------------------------
-- LSP Servers
if not nvim_lsp.emmet_ls then
    default_config = {
      cmd = {'emmet-ls', '--stdio'};
      filetypes = {'html', 'css', 'blade', 'php'};
      root_dir = function(fname)
        return vim.loop.cwd()
      end;
      settings = {};
    };
  end
nvim_lsp.emmet_ls.setup {
    capabilities = capabilities
  }
-- Typescript
nvim_lsp.tsserver.setup {
  on_attach = function(client, bufnr)
    -- Disable tsserver formatting as prettier/eslint does that.
    client.resolved_capabilities.document_formatting = true
    on_attach(client, bufnr)
  end
}
-- Python
nvim_lsp.pyright.setup {
  on_attach = on_attach,
}
-- PHP
nvim_lsp.intelephense.setup {
  on_attach = on_attach,
}
-------------------------
--- Linter setup
local filetypes = {
  typescript = "eslint",
  typescriptreact = "eslint",
  python = "flake8",
  php = {"phpcs", "psalm"},
}

local linters = {
  eslint = {
    sourceName = "eslint",
    command = "./node_modules/.bin/eslint",
    rootPatterns = {".eslintrc.js", "package.json"},
    debouce = 100,
    args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
    parseJson = {
      errorsRoot = "[0].messages",
      line = "line",
      column = "column",
      endLine = "endLine",
      endColumn = "endColumn",
      message = "${message} [${ruleId}]",
      security = "severity"
    },
    securities = {[2] = "error", [1] = "warning"}
  },
  flake8 = {
    command = "flake8",
    sourceName = "flake8",
    args = {"--format", "%(row)d:%(col)d:%(code)s: %(text)s", "%file"},
    formatPattern = {
      "^(\\d+):(\\d+):(\\w+):(\\w).+: (.*)$",
      {
          line = 1,
          column = 2,
          message = {"[", 3, "] ", 5},
          security = 4
      }
    },
    securities = {
      E = "error",
      W = "warning",
      F = "info",
      B = "hint",
    },
  },
  phpcs = {
    command = "phpcs",
    sourceName = "phpcs",
    debounce = 300,
    rootPatterns = {"composer.lock", "vendor", ".git"},
    args = {"--report=emacs", "-s", "-"},
    offsetLine = 0,
    offsetColumn = 0,
    sourceName = "phpcs",
    formatLines = 1,
    formatPattern = {
      "^.*:(\\d+):(\\d+):\\s+(.*)\\s+-\\s+(.*)(\\r|\\n)*$",
      {
        line = 1,
        column = 2,
        message = 4,
        security = 3
      }
    },
    securities = {
      error = "error",
      warning = "warning",
    },
    requiredFiles = {"phpcs"}
  },
  psalm = {
    command = "psalm",
    sourceName = "psalm",
    debounce = 100,
    rootPatterns = {"composer.lock", "vendor", ".git"},
    args = {"--output-format=emacs", "--no-progress"},
    offsetLine = 0,
    offsetColumn = 0,
    sourceName = "psalm",
    formatLines = 1,
    formatPattern = {
      "^[^ =]+ =(\\d+) =(\\d+) =(.*)\\s-\\s(.*)(\\r|\\n)*$",
      {
        line = 1,
        column = 2,
        message = 4,
        security = 3
      }
    },
    securities = {
      error = "error",
      warning = "warning"
    },
    requiredFiles = {"psalm"}
  }
}

nvim_lsp.diagnosticls.setup {
  on_attach = on_attach,
  filetypes = vim.tbl_keys(filetypes),
  init_options = {
    filetypes = filetypes,
    linters = linters,
  },
}
-------------------------
-- Change icons for Lsp Diagnostic
local signs = { Error = "", Warn = "", Info = "כֿ", Hint = "" }
for sign, icon in pairs(signs) do
	vim.fn.sign_define(
		"DiagnosticSign" .. sign,
		{ text = icon, texthl = "Diagnostic" .. sign, linehl = false, numhl = "Diagnostic" .. sign }
	)
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})
-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
	virtual_text = {
    spacing = 2,
		prefix = "◉",  --   prefix = ''
	},
 }
)

