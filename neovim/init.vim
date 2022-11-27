"sourcing the required files for the neovim configiration
for f in split(glob('~/.config/nvim/settings/*.vim'), '\n')
    exe 'source' f
endfor

"lua config files
lua << EOF
require('lualine-config')
require('lsp_config')
require('lsp-kind-config')
require('cmp-config')
require('lspsaga-config')
require('onedark-config')
require('treesitter-config')
require('autotag-config')
EOF
