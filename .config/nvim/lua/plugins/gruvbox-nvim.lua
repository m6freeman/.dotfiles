return {
    "ellisonleao/gruvbox.nvim",
    priority = 500,
    config = function()
        vim.cmd.colorscheme("gruvbox")
        vim.cmd.hi("Comment gui=none")
    end,
}
