" Autocompletion settings
let g:SuperTabDefaultCompletionType = "<c-n>"

" markdown configuration
let g:vim_markdown_folding_disabled = 1

" CTRL P
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)|deps|_build|vendor$'

" Ack vim
let g:ackprg="ack -H --nocolor --nogroup --column --ignore-dir={vendor,.git}"

" Search word under cursor
" nnoremap F :Ack "\b<cword>\b" app lib spec features config<CR>

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Enable JSX syntax highlight in .js files
let g:jsx_ext_required = 0

" Tree view depth
let g:netrw_liststyle = 3

" Fugitive colors
set filetype=fugitiveblame

" Python syntax highlighting
let g:python_highlight_string_templates = 1
let g:python_highlight_indent_errors = 1
let g:python_highlight_class_vars = 1
