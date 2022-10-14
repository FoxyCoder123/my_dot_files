local ts = require 'nvim-treesitter.configs'

ts.setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    ensure_installed = {
        'json','css','go','bash','c','cpp','javascript','html'
    }
}
