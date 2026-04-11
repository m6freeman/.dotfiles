return {
    "LunarVim/bigfile.nvim",
    lazy = false,
    config = function()
        require("bigfile").setup({
            filesize = 1,
            pattern = {
                "*.txt",
                "*.log",
                "*.csv",
                "*.json",
            },
            features = {
                "indent_blankline",
                "treesitter",
                "syntax",
                "matchparen",
            },
        })
    end,
}
