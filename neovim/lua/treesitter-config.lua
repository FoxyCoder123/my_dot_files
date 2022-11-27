local ts = require "nvim-treesitter.configs"

ts.setup({
    highlight = { enable = true },
    indent = { enable = true },
    auto_tag = { enable = true},
    ensure_installed = {
        "json","css","go","bash","c","cpp","javascript","html",
    },
    auto_install = true,
})
