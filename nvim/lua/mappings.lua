require "nvchad.mappings"

local harpoon = require "harpoon"
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Harpoon

map("n", "<leader>H", function()
  harpoon:list():add()
end, { desc = "Harpoon File" })

-- Toggle quick menu
map("n", "<leader>h", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon Quick Menu" })

-- Jump to harpoon files 1-9
for i = 1, 9 do
  map("n", "<leader>" .. i, function()
    harpoon:list():select(i)
  end, { desc = "Harpoon to File " .. i })
end
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
