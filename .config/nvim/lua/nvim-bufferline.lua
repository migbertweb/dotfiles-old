require'bufferline'.setup{
	options = {
            numbers = "buffer_id", -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
            separator_style ="thick" , -- "slant" | "padded_slant" | "thick" | "thin" | { "any", "any" },
            enforce_regular_tabs = false, --false | true,
            always_show_bufferline = true,--true | false,
--            max_name_length = 28,
--            max_prefix_length = 15, -- prefix used when a buffer is deduplicated
--           tab_size = 38,
            diagnostics = "nvim_lsp", -- | "coc",
diagnostics_indicator = function(count, level, diagnostics_dict, context)
  if context.buffer:current() then
    return ''
  end

  return ''
end,
-------
name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
      -- remove extension from markdown files for example
      if buf.name:match('%.md') then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,

		indicator_icon = ' ',
    	buffer_close_icon = '',
    	modified_icon = '●',
    	close_icon = '',
		close_command = "bdelete %d",
		right_mouse_command = "bdelete! %d",
		left_trunc_marker = '',
    	right_trunc_marker = '',
		offsets = {
      {
        filetype = "NvimTree",
        text = function()
      return vim.fn.getcwd()
    end,
    text_align = "center"}
  },
		show_tab_indicators = true,
		show_close_icon = false
	},
	highlights = {
		fill = {
			guifg = {attribute = "fg", highlight = "Normal"},
			guibg = {attribute = "bg", highlight = "StatusLineNC"},
		},
		background = {
			guifg = {attribute = "fg", highlight = "Normal"},
			guibg = {attribute = "bg", highlight = "StatusLine"}
		},
		buffer_visible = {
			gui = "",
            guifg = {attribute = "fg", highlight="Normal"},
            guibg = {attribute = "bg", highlight = "Normal"}
		},
		buffer_selected = {
			gui = "",
            guifg = {attribute = "fg", highlight="Normal"},
            guibg = {attribute = "bg", highlight = "Normal"}
		},
		separator = {
			guifg = {attribute = "bg", highlight = "Normal"},
			guibg = {attribute = "bg", highlight = "StatusLine"},
		},
		separator_selected = {
            guifg = {attribute = "fg", highlight="Normal"},
            guibg = {attribute = "bg", highlight = "Normal"}
		},
		separator_visible = {
			guifg = {attribute = "fg", highlight = "Normal"},
			guibg = {attribute = "bg", highlight = "StatusLineNC"},
		},
		close_button = {
			guifg = {attribute = "fg", highlight = "Normal"},
			guibg = {attribute = "bg", highlight = "StatusLine"}
		},
		close_button_selected = {
            guifg = {attribute = "fg", highlight="normal"},
            guibg = {attribute = "bg", highlight = "normal"}
		},
		close_button_visible = {
            guifg = {attribute = "fg", highlight="normal"},
            guibg = {attribute = "bg", highlight = "normal"}
		},

	},
custom_areas = {
  right = function()
    local result = {}
    local seve = vim.diagnostic.severity
    local error = #vim.diagnostic.get(0, {severity = seve.ERROR})
    local warning = #vim.diagnostic.get(0, {severity = seve.WARN})
    local info = #vim.diagnostic.get(0, {severity = seve.INFO})
    local hint = #vim.diagnostic.get(0, {severity = seve.HINT})

    if error ~= 0 then
      table.insert(result, {text = "  " .. error, guifg = "#EC5241"})
    end

    if warning ~= 0 then
      table.insert(result, {text = "  " .. warning, guifg = "#EFB839"})
    end

    if hint ~= 0 then
      table.insert(result, {text = "  " .. hint, guifg = "#A3BA5E"})
    end

    if info ~= 0 then
      table.insert(result, {text = "  " .. info, guifg = "#7EA9A7"})
    end
    return result
  end,
}
}

