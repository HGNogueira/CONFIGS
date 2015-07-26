"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Generic configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set Unix as the standard file type
set ffs=unix,dos,mac
" Use UTF-8 by default
set encoding=utf-8
" Enable filetype plugins
filetype plugin on
" Enable filetype indentation
filetype indent on
" Enable modeline
set modeline
" Using a 256 colors terminal
set t_Co=256
" Enable mouse
set mouse=a
" Remember 1000 history lines
set history=1000
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" A buffer becomes hidden when it is abandoned
set hid
" For performance don't redraw while executing macros
set lazyredraw
" " Ignore files
set wildignore=*.o,*~,*.pyc,*.aux


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Load Scripts
" " Behaviour
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Reload file when a change is detected
set autoread
" How many tenths of a second to blink when matching brackets
set mat=100000

" " Search
" For regular expressions turn magic on
set magic
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
" Show matching brackets when text indicator is over them
set showmatch

" " Window management
" Opens vertical windows on the right
set splitright
" Opens horizontal windows on the bottom
set splitbelow

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Keep windows open when closing buffer
command! Bclose call <SID>BufcloseCloseIt()
" Remember info about open buffers on close
set viminfo^=%
" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
catch
endtry

" " Vim Session behaviour
let g:session_autosave=0
let g:session_autoload=0

" NERDTree
let NERDTreeShowBookmarks=1

" Instant Markdown
let g:instant_markdown_slow=1
let g:instant_markdown_autostart=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 2 context lines
set so=2
" Turn on the WiLd menu
set wildmenu
" Always show current position
set ruler
" Show line numbers
set nu
" Always show the status line
set laststatus=2

" " Vertical rulers and indicators
" Set 80 and 100 characters vertical rulers
set colorcolumn=80,100
"autocmd VimEnter,Colorscheme * :hi ColorColumn ctermbg=Gray
" Highlight text passing 100 characters
"match ErrorMsg '\%>99v.\+'

" Enable syntax highlighting
syntax enable

" Indent Guides config
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"hi IndentGuidesOdd  ctermbg=black
"hi IndentGuidesEven ctermbg=darkgrey

" Tree style netrw
let g:netrw_liststyle = 3

" Height of the command bar
set cmdheight=1
            
" vim-airline
let g:airline_theme='murmur'

let g:airline_enable_branch = 1

let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1


if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" " Look and feel
" Set theme
colorscheme molokai
highlight Folded ctermfg=11 ctermbg=241 guibg=grey guifg=grey
"colorscheme jellybeans
" Set fonts
set guifont=Ubuntu\ Mono\ 11


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Keyboard shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use , (comma) as the leader
let mapleader = ","
let g:mapleader = ","

" Better configuration for backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Copy in visual mode
map <C-c> "+y<CR>

" Saving files
nmap <leader>w :w<cr>
nmap <leader>x :x<cr>
nmap <leader>qq :q<cr>
nmap <leader>qa :qa<cr>

" Session management
nnoremap <leader>qr :OpenSession<CR>
nnoremap <leader>qs :SaveSession<CR>

" " Search
" Use space to search
map <space> /
" Search from Visual selection with * and #
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Remap VIM 0 to first non-blank character
map 0 ^

" Disable highlight with cr
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tc :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tq :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>tn :tabnext<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" " Spell checking
" Toggle spell checking with <leader>ss
map <leader>ss :setlocal spell!<cr>
" Other shortcuts
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Typing behaviour
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use 4 spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Linebreak on 500 characters
"set lbr
"set tw=500

" Use smart auto indent
set ai
set si

" Automaticaly wrap lines to 80 characters
"set wrap
"set textwidth=80


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Language Specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Python
"autocmd BufWrite *.py :call DeleteTrailingWS()
" " Latex
"autocmd BufWrite *.tex :call DeleteTrailingWS()
" " Git commit
"autocmd BufWrite COMMIT_EDITMSG :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

