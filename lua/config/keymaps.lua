local map = vim.keymap.set

-- File searching
map("n", "<leader>ff", function()
    Snacks.picker.files()
end, { desc = "Find Files" })
map("n", "<leader>fr", function()
    Snacks.picker.recent()
end, { desc = "Recent Files" })
map("n", "<leader>fg", function()
    Snacks.picker.git_files()
end, { desc = "Git Files" })
map("n", "<leader>sg", function()
    Snacks.picker.grep()
end, { desc = "Grep" })

-- LazyGit
map("n", "<leader>gg", function()
    Snacks.lazygit()
end, { desc = "LazyGit" })

-- Buffer navigation
map("n", "<tab>", ":bnext<cr>", { desc = "Next Buffer" })
map("n", "<S-tab>", ":bprev<cr>", { desc = "Prev Buffer" })

-- Close buffer without closing the split
map("n", "<leader>bd", function()
    local buf = vim.api.nvim_get_current_buf()
    vim.cmd("bprev")
    vim.api.nvim_buf_delete(buf, { force = false })
end, { desc = "Delete Buffer" })

-- Page jump (centered)
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Window Left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window Down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window Up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window Right" })

-- Window splits
map("n", "<leader>sh", ":split<cr>", { desc = "Split Horizontal" })
map("n", "<leader>sv", ":vsplit<cr>", { desc = "Split Vertical" })
map("n", "<leader>sc", ":close<cr>", { desc = "Close Window" })

-- Move lines (Option+j / Option+k)
map("n", "∆", "<cmd>m .+1<cr>==", { desc = "Move Line Down" })
map("i", "∆", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Line Down" })
map("x", "∆", ":m '>+1<cr>gv=gv", { desc = "Move Selection Down" })
map("n", "Ż", "<cmd>m .-2<cr>==", { desc = "Move Line Up" })
map("i", "Ż", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Line Up" })
map("x", "Ż", ":m '<-2<cr>gv=gv", { desc = "Move Selection Up" })

-- Indent (Option+l / Option+h)
map("n", "•", ">>", { desc = "Indent" })
map("n", "ķ", "<<", { desc = "Unindent" })
map("i", "•", "<C-t>", { desc = "Indent" })
map("i", "ķ", "<C-d>", { desc = "Unindent" })
map("x", "•", ">gv", { desc = "Indent" })
map("x", "ķ", "<gv", { desc = "Unindent" })

-- Delete without clobbering yank register
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete (no yank)" })
--
-- Paste over selection without clobbering yank register
map("x", "<leader>p", '"_dP', { desc = "Paste (no yank)" })

-- Search stays centered
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Remap '4' to go to the end of the line (replacing '$')
map("n", "4", "$", { desc = "Go to end of line" })
map("x", "4", "$", { desc = "Go to end of line (Visual)" })
map("v", "4", "$", { desc = "Go to end of line" })
