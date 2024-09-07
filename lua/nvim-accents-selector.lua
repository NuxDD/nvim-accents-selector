local accents_list = {
	{'a','à','ä','â','á'}, 
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

	if char_under_cursor == string.char(0xC3) then
		return string.char(0xC3, string.byte(current_line:sub(col+2, col+2)))
	end

	return char_under_cursor
end

--- Return the list of accented characters for the letter given in parameter.
-- @param char Character for which accented characters will be looked up.
-- @return The list of accented characters or nil if the character is not associated to accented characters.
local function get_accented_list(char)
	for _, list in ipairs(accents_list) do
		for _, char_list in ipairs(list) do
			if char == char_list then
				return list
			end
		end
	end
	return nil
end

--- Return the index at which value in found in array, otherwise return nil
-- @param value Value to search
-- @param array Array in which value is searched
-- @return The index of value in array if it is found, otherwise return nil
local function get_index(array, value)
	for i, v in ipairs(array) do 
		if v == value then
			return i
		end
	end
	return nil
end

local function main()
	local mode = vim.api.nvim_get_mode().mode
end

--- Cycle through the list of accented char which correspond to the char under the cursor, and replace it with the next one on the list
-- @return None
local function cycle()
	local char_cursor = get_char_cursor()
	local accented_list = get_accented_list(char_cursor)
	if accented_list == nil then
		return
	end
	local index_char = get_index(accented_list, char_cursor)
	if index_char == nil then
		return
	end
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	vim.api.nvim_buf_set_text(0, row-1, col, row-1, col+string.len(char_cursor), {accented_list[(index_char) % table.getn(accented_list)+1]})
end

-- Create the :Accent user-defined command
vim.api.nvim_create_user_command('Accent', main, {})
-- Create the :AccentCycle user-defined command
vim.api.nvim_create_user_command('AccentCycle', cycle, {})
