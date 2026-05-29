return {
    {
        "folke/noice.nvim",
        opts = {
            routes = {
                {
                    filter = {
                        event = "lsp",
                        kind = "progress",
                        any = {
                            { find = "basedpyright" },
                            { find = "pyright" },
                        },
                    },
                    opts = { skip = true },
                },
            },
        },
    },
}
