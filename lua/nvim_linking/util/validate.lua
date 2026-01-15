local M = {}

function M.validate_dir_name(s)
	if s == nil then error("ERROR: name can not be nil.") end
	if s == "" then error("ERROR: name can not be empty.") end
	if string.find(s, " ", 1, true) then error("ERROR: name can not contain spaces.") end
end

return M

