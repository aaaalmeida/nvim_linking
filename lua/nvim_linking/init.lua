-- NVim >= 0.10 
local M = {}

function M.setup()
    require("nvim_linking.db").create_projects_dir()
end

M.setup()

return M

