local accents_list = {
	{'a','ä','à','â','á'}, 
 	{'A','Ä','À','Â','Á'},
  {'e','é','è','ê','ë'},
  {'E','É','Ê','È'},
  {'i','î','ï','í'},
  {'I','Î','Í'},
  {'o','ö','ô','ó'},
  {'O','Ö','Ô','Ó'},
  {'s','ß'},
  {'u','ü','û','ù','ú'},
  {'U','Ü','Û','Ù','Ú'},
  {'!','¡'},
  {'?','¿'},
  {'n','ñ'},
  {'N','Ñ'},
}

local function get_char_cursor()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local current_line = vim.api.nvim_get_current_line()
	local char_under_cursor = current_line:sub(col+1, col+1)

	return char_under_cursor
end

local function main()
	local mode = vim.api.nvim_get_mode().mode
end

-- Create the :Accent user-defined command
vim.api.nvim_create_user_command('Accent', main, {})
