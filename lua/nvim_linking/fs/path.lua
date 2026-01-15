local M = {}

local DATA_DIR = vim.fn.stdpath("data") .. "/nvim-linking"

function M.data_dir()
    return DATA_DIR
end

function M.projects_dir()
    return DATA_DIR .. "/projects"
end

function M.project(name)
    return M.projects_dir() .. "/" .. name
end

function M.assets()
    return DATA_DIR .. "/assets"
end

function M.db_schema()
    return M.assets() .. "/schema.sql"
end

return M

