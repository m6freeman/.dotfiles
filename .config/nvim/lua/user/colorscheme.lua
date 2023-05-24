    -- COLOR CATALOG --

-- aurora
-- catppuccin
-- codemonkey
-- darkplus
-- ferrum
-- gruvbox
-- lunar
-- onedark
-- onedarker
-- onedarkest
-- onenord
-- spacedark
-- system76
-- tomorrow 

local colorscheme = 'gruvbox'

vim.o.background = 'dark' -- or 'light' for light mode

if colorscheme == 'catppuccin' then
    vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
    require("catppuccin").setup({
        transparent_background = true,
        term_colors = true,
        compile = {
            enabled = false,
            path = vim.fn.stdpath("cache") .. "/catppuccin",
        },
        dim_inactive = {
            enabled = false,
            shade = "dark",
            percentage = 0.15,
        },
        styles = {
            comments = { "italic" },
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
        },
        integrations = {
            -- For various plugins integrations see https://github.com/catppuccin/nvim#integrations
        },
        color_overrides = {},
        highlight_overrides = {},
    })
end


if colorscheme == 'gruvbox' then
    require("gruvbox").setup({
      undercurl = true,
      underline = true,
      bold = true,
      italic = true,
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "soft", -- can be "hard", "soft" or empty string
      overrides = {},
      dim_inactive = false,
      transparent_mode = true,
    })
end









local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
  vim.notify('colorscheme ' .. colorscheme .. ' not found!')
  return
end


