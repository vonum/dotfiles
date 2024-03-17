" Autocompletion settings
let g:SuperTabDefaultCompletionType = "<c-n>"

" markdown configuration
let g:vim_markdown_folding_disabled = 1

" Search
" CTRLP
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)|deps|_build|vendor|node_modules|target|__pycache__$'
" Ack
let g:ackprg = "ack -H --nocolor --nogroup --column --ignore-dir={vendor,.git,node_modules,debug,target}"

" Search word under cursor
" nnoremap F :Ack "\b<cword>\b" app lib spec features config<CR>

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Tree view depth
let g:netrw_liststyle = 3

" Test runners
let test#strategy = "basic"
let test#python#runner = 'pytest'

" Git
let g:gitgutter_map_keys = 0
let g:gitgutter_signs = 0

" Fugitive colors
set filetype=fugitiveblame
