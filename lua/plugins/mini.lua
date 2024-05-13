return {
    "echasnovski/mini.nvim",

    config = function()
        -- Better Around/Inside text objects
        require("mini.ai").setup()

        -- Provide clues for keybinds
        require("mini.clue").setup()

        -- comments using gc
        require("mini.comment").setup()

        -- jump to next/previous single character
        require("mini.jump").setup()

        -- auto adds closing parenthesis
        require("mini.pairs").setup()

        -- keybind for surrounding in brackets
        require("mini.surround").setup()
    end,
}
