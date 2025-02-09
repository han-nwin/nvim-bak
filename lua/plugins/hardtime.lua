return {
    -- hardtime.nvim
    {
        "m4xshen/hardtime.nvim",
        commit = "eaf4bc3",
        lazy = true, --load everytime
        opts = {
            disable_mouse = false, -- Example option, adjust based on your needs
            max_repeat = -1, --allow repeat
            max_time = 3, --set the time limit to 3milsec
            --max_count = 5,        -- Maximum allowed count for motions
        },
        config = function(_, opts)
            require("hardtime").setup(opts)
        end,
        keys = {
            {"<leader>ht", "<cmd>Hardtime enable<CR>", desc = "Enable hardtime",},
            {"<leader>hT", "<cmd>Hardtime disable<CR>", desc = "Disable hardtime",}
        },

    },
}
