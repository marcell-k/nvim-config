return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                python = { "ruff_format", "ruff_organize_imports" },
            },
            formatters = {
                ruff_format = {
                    prepend_args = { "--target-version", "py314" },
                },
                ruff_organize_imports = {
                    prepend_args = { "--target-version", "py314" },
                },
            },
        },
    },
}
