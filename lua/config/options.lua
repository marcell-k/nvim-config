-- Force Neovim's python provider to use a dedicated virtual environment
vim.g.python3_host_prog = vim.fn.expand("~/.local/share/nvim-venv/bin/python")
vim.opt.list = false
vim.opt.listchars = ""
vim.opt.selection = "inclusive"
vim.opt.selectmode = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4 -- tab width
vim.opt.shiftwidth = 4 -- indent wid
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 0
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 200

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.diagnostic.config({
    virtual_text = false, -- Hide inline error messages
    signs = false, -- Hide gutter signs
})
