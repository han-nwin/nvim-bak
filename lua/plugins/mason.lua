-- plugins/mason.lua
return {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason").setup()

    -- Ensure these language servers are installed
    require("mason-lspconfig").setup({
      ensure_installed = { "python-lsp-server", "clangd", "tsserver", "lua_ls" },
    })
  end,
}
