local map = vim.keymap.set

-- Fast file searching
map("n", "<leader>ff", function()
  Snacks.picker.files()
end, { desc = "Find Files (Root)" })
map("n", "<leader>fr", function()
  Snacks.picker.recent()
end, { desc = "Recent Files" })
map("n", "<leader>fg", function()
  Snacks.picker.git_files()
end, { desc = "Git Files" })
map("n", "<leader>sg", function()
  Snacks.picker.grep()
end, { desc = "Grep (Root)" })

-- Buffer navigation
map("n", "<tab>", ":bnext<cr>", { desc = "Next Buffer" })
map("n", "<S-tab>", ":bprev<cr>", { desc = "Previous Buffer" })

-- Window navigation (keep only ONE set)
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Create file in current directory
map("n", "<leader>en", function()
  vim.ui.input({ prompt = "New file: " }, function(filename)
    if filename and filename ~= "" then
      local dir = vim.fn.expand("%:h")
      local path = dir .. "/" .. filename
      vim.cmd.edit(path)
    end
  end)
end, { desc = "Create New File in Current Dir" })

-- Split windows
map("n", "<leader>sh", ":split<CR>", { desc = "Split Horizontal" })
map("n", "<leader>sv", ":vsplit<CR>", { desc = "Split Vertical" })
map("n", "<leader>sc", ":close<CR>", { desc = "Close Window" })
