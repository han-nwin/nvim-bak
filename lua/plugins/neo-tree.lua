return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- For file icons
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true, -- Close Neo-tree if it's the last window
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,

      filesystem = {
        filtered_items = {
          visible = true, -- Show all files, including hidden
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = {
          enabled = true, -- Auto-expand the current file
        },
        hijack_netrw_behavior = "open_current", -- Replace netrw with Neo-tree
        use_libuv_file_watcher = true, -- Auto-refresh when files change
      },

      window = {
        width = 30,
        mappings = {
          ["<space>"] = "none",
        },
      },

      buffers = {
        follow_current_file = true,
      },

      git_status = {
        window = {
          position = "float",
        },
      },
    })
  end
}
