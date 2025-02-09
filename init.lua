-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

--Run colorscheme
vim.cmd("colorscheme catppuccin")
--Assign system register for yank in nvim
vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
        ["+"] = "clip.exe",
        ["*"] = "clip.exe"
    },
    paste = {
        ["+"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))",
        ["*"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))"
    },
    cache_enabled = 0,
}

-- Move to the next buffer
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })

-- Move to the previous buffer
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprev<CR>', { noremap = true, silent = true })

-- Set tab width to 4 spaces
vim.opt.tabstop = 4       -- Number of spaces a <Tab> in the file counts for
vim.opt.shiftwidth = 4    -- Number of spaces for autoindent
vim.opt.expandtab = true  -- Convert tabs to spaces


--Turn off diagnostic for md

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.diagnostic.disable(0)
  end,
})

--set folding method
vim.opt.foldmethod = "manual"
