local M = {}

function M.setup()
	local a = "teste1"
	require("nvim_linking.db").initialize_project(a)
end

return M

