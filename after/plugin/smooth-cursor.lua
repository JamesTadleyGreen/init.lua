require("smoothcursor").setup({
    autostart = true,
    cursor = ">",  -- cursor shape (need nerd font)
    linehl = nil,  -- highlight sub-cursor line like 'cursorline', "CursorLine" recommended
    type = "default", -- define cursor movement calculate function, "default" or "exp" (exponential).
    fancy = {
        enable = true, -- enable fancy mode
        head = { cursor = ">", { bg = "#FFFFFF", fg = "#FFFFFF" }, { fg = "#FFFFFF" } },
        body = {
            { cursor = ">", { bg = nil, fg = "#FFFFFF", default = true } },
        },
    },
    flyin_effect = "top",   -- "bottom" or "top"
    speed = 25,             -- max is 100 to stick to your current position
    intervals = 35,         -- tick interval
    priority = 10,          -- set marker priority
    timeout = 3000,         -- timout for animation
    threshold = 3,          -- animate if threshold lines jump
    disable_float_win = false, -- disable on float window
    enabled_filetypes = nil, -- example: { "lua", "vim" }
    disabled_filetypes = nil, -- this option will be skipped if enabled_filetypes is set. example: { "TelescopePrompt", "NvimTree" }
})
