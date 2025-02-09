--Modify nvim-cmp
return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")

    -- Disable nvim-cmp globally use = false
    opts.enabled = true 

    opts.mapping = cmp.mapping.preset.insert({
      ["<CR>"] = nil, -- Disable Enter for autocomplete
      ["<C-y>"] = cmp.mapping.confirm(), -- Use Ctrl+y to confirm selection
      ["<C-e>"] = cmp.mapping.abort(), -- Use Ctrl-E to close the completion menu
    })
  end,
}
