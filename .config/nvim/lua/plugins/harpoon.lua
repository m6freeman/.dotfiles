return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()
        vim.keymap.set("n", "<leader>ha", function()
            harpoon:list():add()
        end, { desc = "Add to Harpoon" })
        vim.keymap.set("n", "<leader>hl", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Tottle Harpoon List" })
        vim.keymap.set("n", "<leader>h1", function()
            harpoon:list():select(1)
        end, { desc = "Jump to Harpoon 1" })
        vim.keymap.set("n", "<leader>h2", function()
            harpoon:list():select(2)
        end, { desc = "Jump to Harpoon 2" })
        vim.keymap.set("n", "<leader>h3", function()
            harpoon:list():select(3)
        end, { desc = "Jump to Harpoon 3" })
        vim.keymap.set("n", "<leader>h4", function()
            harpoon:list():select(4)
        end, { desc = "Jump to Harpoon 4" })
        vim.keymap.set("n", "<S-h>", function()
            harpoon:list():prev()
        end, { desc = "Jump to previous Harpoon" })
        vim.keymap.set("n", "<S-l>", function()
            harpoon:list():next()
        end, { desc = "Jump to next Harpoon" })
    end,
}
