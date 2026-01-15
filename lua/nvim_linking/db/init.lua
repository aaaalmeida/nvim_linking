local M = {}

function M.create_projects_dir()
    local projects_dir = require("nvim_linking.fs.path").projects_dir()
    vim.system({"mkdir", "-p", projects_dir}, {text=true}, function(response)
        if response.code ~= 0 then
            vim.notify("NVIM_LINKING - Error: Could not create projects directory.", vim.log.levels.ERROR)
            return
        end
    end)
end

function M.initialize_project(name)
    require("nvim_linking.util.validate").validate_dir_name(name)
    local project_dir = require("nvim_linking.fs.path").project(name)

    vim.system({"mkdir", "-p", project_dir}, {text=true}, function(response)
        if response.code ~= 0 then
            vim.notify("NVIM_LINKING - Error: Could not create project " .. name .. " directory.", vim.log.levels.ERROR)
            return
        end
    end)

    local db_path = project_dir .. "db.sqlite"
    local schema_path = require("nvim_linking.fs.path").db_schema()
    local schema = table.concat(vim.fn.readfile(schema_path), "\n")

    vim.system({"sqlite3", db_path}, {stdin=schema, text=true}, function(response)
        if response.code ~= 0 then
            vim.schedule(function()
                vim.notify(response.stderr, vim.log.levels.ERROR)
            end)
        end
    end)

    vim.notify_once("NVIM_LINKING - INFO: New project initialized successfully.", vim.log.levels.INFO)
end

return M

