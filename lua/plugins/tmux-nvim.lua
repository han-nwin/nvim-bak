return {
  {
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup({
        navigation = {
          enable_default_keybindings = true, -- Enables <C-h,j,k,l>
        },
      })
    end,
  }

}
