return {
	"echasnovski/mini.nvim",

	config = function()
		-- Add module specific configs here
		local modules = {
			-- Better Around/Inside text objects
			ai = {},

			-- jump to next/previous single character
			jump = {},

			-- auto adds closing parenthesis
			pairs = {},

			-- surrounding text object
			surround = {},
		}

		-- class="asdasd"
		-- className="asdasd"
		-- class='asdasd'
		-- className='asdasd'

		for k, v in pairs(modules) do
			local module = "mini." .. k
			require(module).setup(v)
		end
	end,
}
