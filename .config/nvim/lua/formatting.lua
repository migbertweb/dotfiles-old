-- Formatters
-- Formatting can be run via :Format
local formatter = require('formatter')

local eslint_fmt = {
  function()
    return {
      exe = "eslint",
      args = {"--fix", vim.api.nvim_buf_get_name(0)},
      stdin = false,
    }
  end
}

formatter.setup {
  logging = true,
  filetype = {
    typescript = eslint_fmt,
    typescriptreact = eslint_fmt,
    javascript = eslint_fmt,
    javascriptreact = eslint_fmt,
 
    python = {
      function ()
        return {
          exe = 'black',
          args = {},
          stdin = false,
        }
      end
      },
    php = {
      function ()
        return {
          exe = 'php-cs-fixer',
          args = {'fix'},
          stdin = false,
          ignore_exitcode = false,
        }
      end
    },
     lua = {   
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
    },
  }
}
