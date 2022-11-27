"-----------------------------------------------------
"TokyoNight theme config
"-----------------------------------------------------
colorscheme tokyonight-storm

"-----------------------------------------------------
"Moving across windows in vim
"-----------------------------------------------------

"remapping leader key
let mapleader = " "
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>h <C-w>h

"-----------------------------------------------------
"Html CSS emmet config
"-----------------------------------------------------

let g:user_emmet_mode='n'
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key=','

" To Enable the html snippet in vim use the following keys combination:
" type html:5 and press , twice to trigger the snippet

"-----------------------------------------------------
"Splitting the screen and select all features
"-----------------------------------------------------

"for spliting the vim in vertical
nnoremap <silent><leader>v :vs<CR>

"for spliting the vim in horizontal
nnoremap <silent><leader>b :sp<CR>

"for select all the lines ie, press \a to select all
nnoremap <S-a> ggVG

"-----------------------------------------------------
"Navigation within vim
"-----------------------------------------------------

"multiple tab settings

nnoremap <silent><leader>t :tabnew<CR>
nnoremap <silent><leader>a :tabp<CR>
nnoremap <silent><leader>d :tabn<CR>

"for naming the newfile in the new tab use 
"**** :write name-of-the-document ****
"
"if u want ot open a existing file in the new tav use
"**** :e path/file_name
"**** :e .
"**** :bp for moving previous buffer ie previous file
"**** :bn for moving next buffer ie next file
"**** use ctrl+^ for toggle b/w the files

"to indent multiple code block at same time then,
"select the lines in visual mode and 
"press shift + ./, (> <) to move left or
"right

"-----------------------------------------------------
"Execution of programming files
"-----------------------------------------------------

"used for executing c, c++, python files from itself
autocmd filetype python nnoremap <F4> :w <bar> exec '!clear;python '.shellescape('%')<CR>
autocmd filetype c nnoremap <F4> :w <bar> exec '!clear;gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!clear;g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

autocmd FileType make set noexpandtab
au Filetype python setl et ts=4 sw=4
"-----------------------------------------------------
"Autocompletion of brackets and punctuations
"-----------------------------------------------------

inoremap (; ();<left><left>
inoremap {; {};<left><left>
inoremap [; [];<left><left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap {{ {{  }}<left>
inoremap {% {%  %}<left>
inoremap {<cr> {<cr>}<esc>O
inoremap (<cr> (<cr>)<esc>O
inoremap [<cr> [<cr>]<esc>O
inoremap " ""<left>
inoremap ' ''<left>
inoremap ` ``<left>
inoremap ``` ```<cr>```<esc>O

"-----------------------------------------------------
"comment.nvim configs
"-----------------------------------------------------

"usage:
"`gcc` - Toggles the current line using linewise comment
"`gbc` - Toggles the current line using blockwise comment
"`[count]gcc` - Toggles the number of line given as a "prefix-count using linewise
"`[count]gbc` - Toggles the number of line given as a "prefix-count using blockwise
"`gc[count]{motion}` - (Op-pending) Toggles the region using "linewise comment
"`gb[count]{motion}` - (Op-pending) Toggles the region using "blockwise comment
"
"# Linewise
"`gcw` - Toggle from the current cursor position to the next word
"`gc$` - Toggle from the current cursor position to the end of "line
"`gc}` - Toggle until the next blank line
"`gc5j` - Toggle 5 lines after the current cursor position
"`gc8k` - Toggle 8 lines before the current cursor position
"`gcip` - Toggle inside of paragraph
"`gca}` - Toggle around curly brackets
"
"# Blockwise
"`gb2}` - Toggle until the 2 next blank line
"`gbaf` - Toggle comment around a function (w/ LSP/treesitter "support)
"`gbac` - Toggle comment around a class (w/ LSP/treesitter "support)


"-----------------------------------------------------
"Telescope configs
"-----------------------------------------------------

nnoremap <silent> <C-f> <cmd>Telescope find_files<cr>
nnoremap <silent> <C-g> <cmd>Telescope live_grep<cr>
nnoremap <silent> <C-b> <cmd>Telescope buffers<cr>
nnoremap <silent> <S-h> <cmd>Telescope help_tags<cr>

"-----------------------------------------------------
"autocmd for go
"-----------------------------------------------------
autocmd BufWritePre *.go lua go_org_imports(1000)

"-----------------------------------------------------
"autocompletion configs
"-----------------------------------------------------

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

"-----------------------------------------------------
"NVIM Tree configs
"-----------------------------------------------------
nnoremap <silent> <leader>n :NvimTreeToggle<CR>
