" Delete empty space from the end of lines on every save
autocmd BufWritePre * :%s/\s\+$//e

" Set up default path
exe "set path=".expand("$PATH")

set title
set nomodeline

" Enable syntax highlighting
syntax enable

" Colorscheme
colorscheme palenight
set background=dark

" sync clipboards
set clipboard=unnamedplus

" Hide annoying E37: No write since last change (add ! to override)
set hidden

" Font options
set guifont=Monospace:h15

" Show line numbers
set number
set numberwidth=4
set ruler

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

" Override default python plugin
autocmd FileType python setlocal tabstop=2
autocmd FileType python setlocal shiftwidth=2
autocmd FileType python setlocal softtabstop=2
autocmd FileType python setlocal expandtab

" Always show the statusline
set laststatus=2

" Sane search options
set hlsearch   " Highlight search
set incsearch  " Incremental search
set magic      " Set magic on, for regular expressions
set ignorecase " Searches are Non Case-sensitive
set smartcase

" Sane folding defaults, use zf to fold and zd to unfold
set foldenable
set foldmethod=marker
set foldlevel=0
set foldcolumn=0

" Improves redrawing for newer computers
set ttyfast
set lazyredraw         " The screen won't be redrawn unless actions took place

set showmatch          " Shows matching brackets when text indicator is over them
set scrolloff=5        " Show 5 lines of context around the cursor
set sidescrolloff=20
set scrolljump=10

set showcmd
set diffopt+=context:3

" Disable backups and swap files
set nobackup
set nowritebackup
set noswapfile

" Disable all bells and whistles
set noerrorbells visualbell t_vb=

set pastetoggle=<F1>
set showmode

" Wild menu (Autocompletion)"
set wildmenu
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.jpeg,*.png,*.xpm,*.gif
set wildmode=full

" Backspace will delete EOL chars, as well as indents
set backspace=indent,eol,start

" For characters that forms pairs for using % commands, this is for HTML Tags
set matchpairs+=<:>

" To avoid the 'Hit Enter' prompts caused by the file messages
set shortmess=atToOI

if !has('nvim')
  " Set default encoding to utf-8
  set encoding=utf-8
  set termencoding=utf-8
endif

" set correct filetypes for various languages
au BufRead,BufNewFile *.cap setlocal filetype=ruby
au BufRead,BufNewFile Capfile* setlocal filetype=ruby
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.md setlocal colorcolumn=+1

au BufRead,BufNewFile *.feature setlocal spell

" Instantly leave insert mode when pressing <ESC>
" This works by disabling the mapping timeout completely in normal
" mode, and enabling it in insert mode with a very low timeout length.
augroup fastescape
  autocmd!

  set notimeout
  set ttimeout
  set timeoutlen=10

  au InsertEnter * set timeout
  au InsertLeave * set notimeout
augroup END

" Override theme colors
hi Search ctermbg=LightGreen
hi IncSearch ctermbg=LightGreen
hi Directory ctermfg=LightCyan

" DVC
autocmd! BufNewFile,BufRead Dvcfile,*.dvc setfiletype yaml
