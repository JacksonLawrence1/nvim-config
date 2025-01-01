return {
	"echasnovski/mini.nvim",

	config = function()
		-- Better Around/Inside text objects
		require("mini.ai").setup()

		-- Provide clues for keybinds
		require("mini.clue").setup()

		-- no longer needed since neovim 10.0.0
		-- require("mini.comment").setup()

		-- jump to next/previous single character
		require("mini.jump").setup()

		-- auto adds closing parenthesis
		require("mini.pairs").setup()

		-- surrounding text object
		require("mini.surround").setup()

		local languages = {
			python = { "print(", ")" },
			lua = { "print(", ")" },
			javascript = { "console.log(", ");" },
			typescript = { "console.log(", ");" },
			javascriptreact = { "console.log(", ");" },
			typescriptreact = { "console.log(", ");" },
			rust = { 'println!("', '");' },
			go = { "fmt.Println(", ")" },
			java = { 'System.out.println("', '");' },
			cs = { 'Console.WriteLine("', '");' },
		}


		-- keybind for printing the current line
		vim.keymap.set("n", "<leader>p", function()
			-- surround the current line with its equivalent print statements
			local line = vim.api.nvim_get_current_line()

			local indent = line:match("^%s*")

			-- get line content and remove semicolon if it exists
			local content = line:match("^%s*(.-)%s*;?$")

			local filetype = vim.bo.filetype
			local print_command = languages[filetype]

			if print_command then
				vim.api.nvim_set_current_line(indent .. print_command[1] .. content .. print_command[2])
			end
		end, { noremap = true, silent = true })
	end,
}
