" Delete empty space from the end of lines on every save
autocmd BufWritePre * :%s/\s\+$//e

" Set up default path
exe "set path=".expand("$PATH")

" Colorscheme
colorscheme palenight
set background=dark
" Override theme colors
hi Search ctermbg=LightGreen
hi IncSearch ctermbg=LightGreen
hi Directory ctermfg=LightCyan

" Show line numbers
set number
set nomodeline

" Don't override cursor
set guicursor=

" Always show the statusline
set laststatus=2

" sync clipboards
set clipboard=unnamed

" Formatting options
set wrap      " Soft Wrap in all files
set linebreak " Maintains the whole words when wrapping

" Indentation
set autoindent
set cindent
set smartindent

" Tab options
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

" Sane search options
set hlsearch   " Highlight search
set incsearch  " Incremental search
set ignorecase " Searches are non case-sensitive
set smartcase  " Search is case-sensitive if there is at least one capitalized letter

set showmatch          " Shows matching brackets when text indicator is over them
set scrolloff=5        " Show 5 lines of context around the cursor
set sidescrolloff=20
set scrolljump=10

" Disable backups and swap files
set nobackup
set nowritebackup
set noswapfile

" Disable all bells and whistles
set noerrorbells visualbell t_vb=

" Backspace will delete EOL chars, as well as indents
set backspace=indent,eol,start

" set correct filetypes for various languages
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.md setlocal colorcolumn=+1
au BufRead,BufNewFile *.feature setlocal spell

if !has('nvim')
  " Set default encoding to utf-8
  set encoding=utf-8
  set termencoding=utf-8
endif
