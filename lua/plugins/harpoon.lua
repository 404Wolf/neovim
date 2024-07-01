local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

for i = 1, 9 do
	vim.keymap.set("n", "<A-" .. i .. ">", function()
		harpoon:list():select(i)
	end)
end

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-Tab>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<C-S-Tab>", function()
	harpoon:list():next()
end)
