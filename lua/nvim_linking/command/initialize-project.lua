function(opts)
    local default_dir = vim.fn.stdpath("data") .. "/nvim-linking" -- $HOME/.local/share/nvim + nvim-linking
    local schema_path = default_dir .. "/schema.sql"

    -- TODO: TESTAR SE uv.fs_stat (ou loop.fs_stat) FUNCIONA IGUAL fs.exists
    --if not vim.fs.exists(schema_path) then
    if not vim.uv.fs_stat(schema_path) then
        -- TODO: add support to healthcheck
        vim.notify("nvim-linking: Error: could not find default schema.", vim.log.levels.ERROR)
        return
    end

    local schema_line = vim.fn.readfile(schema_path)
    local schema = table.concat(schema_line, "\n")

    local cwd = vim.uv.cwd()
    local cwd_basename = vim.fs.basename(cwd)

    local project_dir = default_dir .. "/" .. cwd_basename
    local db_path = project_dir .. "/db.sqlite"
    vim.system({"mkdir", "-p", project_dir}, {}, function(resp)
        if resp.code ~= 0 then
            -- TODO: tratar erros (nome invalido, normalizar path, outro projeto com o msm nome...)
            vim.notify("nvim-linking: Error: could not create directory.", vim.log.levels.ERROR)
            return
        end
    end)
    
    vim.system({ "sqlite3", db_path }, { stdin=schema }, function(sql_resp)
        if sql_resp ~= 0 then
            -- TODO: tratar erro
            --vim.notify(sql_resp.stderr, vim.log.levels.ERROR)
            print(sql_resp.stderr)
            --for k, v in pairs(sql_resp.stderr) do
            --  print(k)
            --end
            return
        end
        vim.notify("nvim-linking: Project initialized with success.", vim.log.levels.INFO))
end

