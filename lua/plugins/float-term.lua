return {
    "voldikss/vim-floaterm",
    lazy = false, -- or true if you want to load on specific events
    init = function()
        -- Optional: basic settings before plugin loads
        vim.g.floaterm_shell = vim.o.shell
        vim.g.floaterm_position = 'bottom'
        vim.g.floaterm_height = 0.3
        vim.g.floaterm_width = 0.9
        vim.g.floaterm_title = 'Terminal ($1/$2)'
    end,
    config = function()
        -- Optional: post-load configuration if needed
        -- You can put remaps here or in your keymaps config
    end
}
