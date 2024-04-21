return {
	"neanias/everforest-nvim",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("everforest")
		vim.cmd.hi("Comment gui=none")
	end,
}
