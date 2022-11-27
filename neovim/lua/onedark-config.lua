local theme = require 'onedark'

theme.setup {
    style = 'dark',
    term_colors = true,
    code_style = {
        comments = 'italic'
    },
    diagnostics = {
        darker = true,
        undercurl = true,
        background = true
    },
}

theme.load()
