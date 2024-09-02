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

--- Return the character under the cursor when :Accent is called.
-- @return a char
local function get_char_cursor()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local current_line = vim.api.nvim_get_current_line()
	local char_under_cursor = current_line:sub(col+1, col+1)

	return char_under_cursor
end

--- Return the list of accented characters for the letter given in parameter.
-- @param char Character for which accented characters will be looked up.
-- @return The list of accented characters or nil if the character is not associated to accented characters.
local function get_accented_list(char)
	for i, list in ipairs(accents_list) do
		if char == list[1] then
			return list
		end
	end
	return nil
end

local function main()
	local mode = vim.api.nvim_get_mode().mode
end

-- Create the :Accent user-defined command
vim.api.nvim_create_user_command('Accent', main, {})
