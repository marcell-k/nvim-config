-- lua/plugins/treesitter.lua
return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "python", "lua", "bash", "json", "toml", "yaml" },
        },
    },
}
