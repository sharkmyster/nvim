return {
  "Shatur/neovim-ayu",
  lazy = false,    -- Load the plugin immediately
  priority = 1000, -- Ensure the theme is loaded first
  config = function()
    require('ayu').setup({
      mirage = true,           -- Use Ayu Mirage variant
      overrides = {},          -- Additional color overrides
    })
    vim.cmd("colorscheme ayu") -- Set the colorscheme
  end,
}
