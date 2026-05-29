return {
    {
        "mason-org/mason.nvim",
        opts = {
            ensure_installed = {
                -- Formatters
                "ruff", -- Python linter + formatter

                -- LSP Servers
                "basedpyright",
            },
        },
    },
}
