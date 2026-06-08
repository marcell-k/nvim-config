return {
    {
        "mason-org/mason.nvim",
        opts = {
            ensure_installed = {
                -- LSP servers
                "basedpyright",

                -- Formatters / linters
                "ruff",
            },
        },
    },
}
