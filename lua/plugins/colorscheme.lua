return {
  -- Install rose-pine
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        dark_variant = "main", -- Options: main, moon, dawn
        disable_background = true, -- Make true if you want transparent
      })
    end,
  },

  -- Config catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    config = function()
      require("catppuccin").setup({
        term_colors = true,
        transparent_background = false,
        dim_inactive = {
          enabled = true, -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        flavour = "mocha", -- Options: latte, frappe, macchiato, mocha
        custom_highlights = function(colors)
          return {
            Normal = { bg = "NONE" }, -- Transparent editor background
            NormalFloat = { bg = colors.base }, -- Keep floating windows non-transparent
            -- Additional highlights can be customized here
          }
        end,
        integrations = {
          cmp = true,
          treesitter = true,
          gitsigns = true,
          telescope = false,
          nvimtree = true,
          lsp_trouble = true,
          bufferline = true,
          markdown = true,
          mason = true,
          -- Add more integrations if needed
        },
      })
    end,
  },

  -- Install solarized-osaka
  {
    "wuelnerdotexe/vim-enfocado",
    name = "solarized-osaka",
    config = function()
      vim.cmd("colorscheme enfocado") -- Load solarized-osaka as the default if you prefer
    end,
  },
}
