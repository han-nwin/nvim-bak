return {
    {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
        require("mini.ai").setup() -- Enable mini ai for surround text
        require("mini.surround").setup() -- Enable surround text
    end
    }
}

