require('lualine').setup {
-- theme visual
  theme = 'vscode',

  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },

-- tabline = {
--  lualine_a = {{'filename',
--      file_status = false, -- displays file status (readonly status, modified status)
--      path = 2 -- 0 = just filename, 1 = relative path, 2 = absolute path
--}},
--  lualine_b = {},
--  lualine_c = {},
--  lualine_x = {},
--  lualine_y = {},
--  lualine_z = {{
--      'buffers',
 --     show_filename_only = true,   -- Shows shortened relative path when set to false.
  --    show_modified_status = true, -- Shows indicator when the buffer is modified.
--      mode = 1, -- 0: Shows buffer name
                -- 1: Shows buffer index (bufnr)
                -- 2: Shows buffer name + buffer index (bufnr) 
  --      },
  --     'tabs'
-- }
-- },
  extensions = {
    'fugitive',
    'nvim-tree'
  }
}

