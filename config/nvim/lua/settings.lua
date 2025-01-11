local global = vim.g
local o = vim.o

global.mapleader = " "

-- Colorscheme
-- colorscheme nightfox
-- set background=dark
-- " Override theme colors
-- hi Search ctermbg=LightGreen
-- hi IncSearch ctermbg=LightGreen
-- hi Directory ctermfg=LightCyan
o.background = "dark"

-- Encoding
o.encoding = "utf-8"

-- Show line numbers
o.number = true
o.modeline = false

-- Always show status line
o.laststatus = 2

-- Don't change mouse settings and cursor
o.mouse = ""
o.guicursor = "a:ver25"

-- Sync clipboards
o.clipboard = "unnamed"

-- Formatting options
o.wrap = true      -- Soft wrap
o.linebreak = true -- Maintain word when wrapping

-- Indentation
o.autoindent = true
o.cindent = true
o.smartindent = true

-- Tab options
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.expandtab = true

-- Sane search options
o.hlsearch = true   -- Highlight search
o.incsearch = true  -- Incremental search
o.ignorecase = true -- Searches are non case-sensitive
o.smartcase = true  -- Search is case-sensitive if there is at least one capitalized letter

o.showmatch = true   -- Shows matching brackets when text indicator is over them
o.scrolloff = 5      -- Show 5 lines of context around the cursor
o.sidescrolloff = 20
o.scrolljump = 10

-- Disable backups and swap files
o.backup = false
o.writebackup = false
o.swapfile = false

-- Disable bells
o.errorbells = false
o.visualbell = false
o.belloff = "all"

-- Backspace will delete EOL chars, as well as indents
o.backspace = "indent,eol,start"

-- Remove white space at the end of the line
vim.cmd([[autocmd BufWritePre * :%s/\s\+$//e]])

vim.cmd([[
  au BufRead,BufNewFile *.md setlocal textwidth=80
  au BufRead,BufNewFile *.md setlocal colorcolumn=+1
]])
