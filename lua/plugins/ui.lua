return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            theme = "dragon", -- "wave", "dragon",
            terminalColors = true,
            undercurl = true,
            commentStyle = { italic = true },
            keywordStyle = { italic = false },
            statementStyle = { bold = true },
            transparent = false,
            dimInactive = false,

            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = "none",
                        },
                    },
                },
            },

            overrides = function(colors)
                local theme = colors.theme

                local makeDiagnosticColor = function(color)
                    local c = require("kanagawa.lib.color")
                    return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
                end

                return {
                    -- 1. Dark/Borderless Floats (Lazy, Mason, etc.)
                    NormalFloat = { bg = "none" },
                    FloatBorder = { bg = "none" },
                    FloatTitle = { bg = "none" },
                    NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
                    LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                    MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

                    -- 2. Popup Menu (cmp/blink)
                    Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
                    PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                    PmenuSbar = { bg = theme.ui.bg_m1 },
                    PmenuThumb = { bg = theme.ui.bg_p2 },

                    -- 3. Diagnostics Virtual Text
                    DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
                    DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
                    DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
                    DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
                }
            end,
        },
    },

    {
        "LazyVim/LazyVim",
        opts = { colorscheme = "kanagawa-dragon" },
    },

    {
        "nvim-lualine/lualine.nvim",
        opts = function(_, opts)
            opts.options = vim.tbl_extend("force", opts.options or {}, {
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
            })

            opts.sections = {
                lualine_a = {
                    {
                        "mode",
                        fmt = function(s)
                            return s:sub(1, 1)
                        end,
                    },
                },
                lualine_b = { { "branch", icon = "" } },
                lualine_c = {
                    { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                    { "filename", path = 1, symbols = { modified = "●", readonly = "", unnamed = "[No Name]" } },
                },
                lualine_x = {
                    { "diff", symbols = { added = " ", modified = " ", removed = " " } },
                    { "diagnostics", symbols = { error = " ", warn = " ", info = " ", hint = " " } },
                },
                lualine_y = {},
                lualine_z = {},
            }

            opts.inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { { "filename", path = 1 } },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            }

            return opts
        end,
    },
}
