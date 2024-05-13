return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        theme = "auto",
        sections = {
            lualine_x = { "filetype" },
        },
    },
    config = function(_, opts)
        require("lualine").setup(opts)
    end,
}
