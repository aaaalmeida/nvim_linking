local M = {}

function M.create_projects_dir()
    local projects_dir = require("nvim_linking.fs.paths").projects()
    print(projects_dir)
    --[[vim.system({"mkdir", "-p", projects_dir}, {}, function(res)
        if res.code ~= 0 then
            vim.notify_once("NVIM-LINKING: Error: Could not create projects directory", vim.log.levels.ERROR)
            return
        end
    end)]]-- 
end

return M
