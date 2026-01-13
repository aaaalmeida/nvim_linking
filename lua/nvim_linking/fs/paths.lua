local M = {}

local DATA_DIR = vim.fn.stdpath("data") .. "/nvim_linking"

function M.data_dir()
    return DATA_DIR
end

function M.assets()
    return DATA_DIR .. "/assets"
end

function M.projects()
    return DATA_DIR .. "/projects"
end

function M.project_db(name)
    return M.projects() .. "/" .. name .. "/db.sqlite"
end

return M

