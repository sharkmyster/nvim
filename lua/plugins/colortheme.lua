return {
  "Shatur/neovim-ayu",
  lazy = false,    -- Load the plugin immediately
  priority = 1000, -- Ensure the theme is loaded first
  config = function()
    require('ayu').setup({
      mirage = true, -- Use Ayu Mirage variant
      overrides = {

      },                       -- Additional color overrides
    })
    vim.cmd("colorscheme ayu") -- Set the colorscheme
    vim.api.nvim_set_hl(0, "@markup.link.label", { underline = false })
    vim.api.nvim_set_hl(0, "@string.special.url", { underline = false })
    vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { underline = true, sp = "#ff9e64" })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#4db8d5" })
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#4db8d5" })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#4db8d5" })
  end,
}
