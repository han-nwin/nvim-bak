return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { "python", "lua", "cpp", "graphql", "typescript", "javascript", "go", "c" }, -- Add desired languages
      highlight = {
        enable = true, -- Enable highlighting
        additional_vim_regex_highlighting = false, -- Avoid conflicts with Vim's regex highlighting
      },
    }
  end,
}
