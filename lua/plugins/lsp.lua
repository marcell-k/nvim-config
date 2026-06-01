local FALLBACK_PYTHON = vim.fn.expand("~/.local/share/nvim-venv/bin/python")

return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                pyright = { enabled = false },

                basedpyright = {
                    -- 1. Establish the 3.14 baseline properties on startup
                    settings = {
                        python = {
                            pythonPath = FALLBACK_PYTHON,
                        },
                        basedpyright = {
                            analysis = {
                                pythonVersion = "3.14",
                                typeCheckingMode = "basic",
                                diagnosticMode = "openFilesOnly",
                            },
                        },
                    },

                    -- 2. Force an active configuration sync immediately after boot
                    on_init = function(client)
                        local root = client.config.root_dir or vim.uv.cwd()
                        local python_path = FALLBACK_PYTHON

                        -- Highly efficient check for local project virtual environments
                        for _, venv in ipairs({ ".venv", "venv", ".env" }) do
                            local candidate = root .. "/" .. venv .. "/bin/python"
                            if vim.uv.fs_stat(candidate) then
                                python_path = candidate
                                break
                            end
                        end

                        -- Safely merge the verified path into the active client configurations
                        client.config.settings = vim.tbl_deep_extend("force", client.config.settings or {}, {
                            python = { pythonPath = python_path },
                        })

                        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
                    end,
                },
            },
        },
    },
}
