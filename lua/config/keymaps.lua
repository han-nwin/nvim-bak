-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- in keymaps.lua or wherever you keep key mappings
local map = vim.keymap.set

-- Search for reference 
map("n", "gr", function()
  vim.lsp.buf.references()
end, {desc = "Find References"})

-- Rename function
map("n", "<leader>rn", function()
  vim.lsp.buf.rename()
end, {desc = "Rename Symbol"})

-- Global keymap for LSP go-to-definition
vim.keymap.set('n', 'gd', function()
    vim.lsp.buf.definition()
end, { noremap = true, silent = true, desc = "Go to definition (LSP)" })


--hover keymap to show information
vim.keymap.set("n", "gh", vim.lsp.buf.hover, { buffer = true, desc = "Show hover information" })


-- Move to the start of each selected line for typing
vim.api.nvim_set_keymap('v', 'ab', [[:<C-u>normal! ^<CR>]], { noremap = true, silent = true })

-- Move to the end of each selected line for typing
vim.api.nvim_set_keymap('v', 'aa', [[:<C-u>normal! $a<CR>]], { noremap = true, silent = true })

-- Open diagnostic float window
vim.keymap.set('n', '<leader>xf', vim.diagnostic.open_float, { noremap = true, silent = true })

-- Disable q: to show command history
vim.keymap.set("n", "q:", "<nop>", { noremap = true, silent = true })

-- Prevent Control Z to terminate nvim
vim.api.nvim_set_keymap('n', '<C-z>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-z>', '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-z>', '<NOP>', { noremap = true, silent = true })
