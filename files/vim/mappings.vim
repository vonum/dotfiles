" Define space as map leader (' ')
let mapleader = " "

" Treat long lines as separate lines
map j gj
map k gk

" Easier navigation between split windows CTRL + { h, j, k, l }
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Faster saving and exiting
nnoremap <silent><leader>q :q!<CR>
nnoremap <silent><leader>w :w!<CR>
nnoremap <silent><leader>x :x<CR>
nnoremap <silent><leader>Q :qa!<CR>
nnoremap <silent><leader>W :wa!<CR>
nnoremap <silent><leader>X :xa<CR>
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<CR>

nnoremap <silent><leader>e :NvimTreeToggle<CR>

" Switch to alternate file
nnoremap <leader><leader> <c-^>
" Open Buffer
nnoremap <silent><leader>l :BufExplorer<CR>
" Open test file for the current file
nnoremap <silent><leader>s :A<CR>
" Open test file for the current file in a vertical window
nnoremap <silent><leader>S :AV<CR>
" Open test file for elixir
nnoremap <silent><leader>t :call ElixirAlternateFile()<CR>

" Splits
nnoremap <silent><leader>v :vs<CR>
nnoremap <silent><leader>h :split<CR>

" Paste mode
nnoremap <F1> :set invpaste paste?<CR>

" Indent visual selected code without unselecting
vmap > >gv
vmap < <gv
vmap = =gv

" Clear search highlighting
nnoremap <silent><leader><CR> :nohl<CR>

" Moving by word taking into account camel and snake case
map ,w <Plug>CamelCaseMotion_w
map ,b <Plug>CamelCaseMotion_b
map ,e <Plug>CamelCaseMotion_e
sunmap ,w
sunmap ,b
sunmap ,e

" Git
nnoremap <silent><leader>g :Git blame<CR>
nnoremap <silent><leader>df :GitGutterSignsToggle<CR>

" Testing
nnoremap <silent><leader>; :TestNearest<CR>
nnoremap <silent><leader>' :TestFile<CR>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
