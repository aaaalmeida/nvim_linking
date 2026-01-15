local M = {}

local DATA_DIR = vim.fn.stdpath("data")

function M.data_dir()
    return DATA_DIR
end

function M.plugin_root_dir()
    return M.data_dir() .. "/nvim_linking"
end

function M.projects_dir()
    return M.plugin_root_dir() .. "/projects"
end

function M.project(name)
    return M.projects_dir() .. "/" .. name .. "/"
end

function M.assets()
    return M.plugin_root_dir() .. "/assets"
end

function M.db_schema()
    return M.assets() .. "/schema.sql"
end

return M

