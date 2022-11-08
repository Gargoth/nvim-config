" Mappings
let mapleader=" "

"" Copy  to clipboard
if has('wsl')
    nnoremap <leader>y :'<,'>w !clip.exe<CR>
    nnoremap <leader>c :w !clip.exe<CR>
else
    nnoremap <leader>y "+y
    nnoremap <leader>c :%y+
endif

"" Switch between splits with alt+movement
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"" Resizing splits
nnoremap <leader>. <C-w>>
nnoremap <leader>, <C-w><
nnoremap <leader>= <C-w>+
nnoremap <leader>- <C-w>-

"" Tabs
nnoremap tn :tabnew<CR>
nnoremap tw :tabclose<CR>

"" Plugins
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <C-b> <cmd>NvimTreeToggle<cr>
nnoremap <a-L> :lua require("nabla").popup()<cr>
nnoremap <leader>p :Prettier<cr>
