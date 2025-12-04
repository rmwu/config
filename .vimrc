" download + configure vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'airblade/vim-gitgutter'

Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'mattn/emmet-vim'

call plug#end()

highlight Pmenu ctermbg=gray

" change the mapleader from \ to ,
let mapleader=","

" enable mouse scrolling ONLY in normal mode
" AND disable mouse clicks
set mouse=n
:nmap <LeftMouse> <nop>
:imap <LeftMouse> <nop>
:vmap <LeftMouse> <nop>

"" syntax highlighting
syntax on
hi Comment   ctermfg=yellow
hi String    ctermfg=blue
hi Number    ctermfg=magenta
hi Float     ctermfg=magenta
hi Boolean   ctermfg=magenta

hi Function  ctermfg=cyan
hi Identifier  ctermfg=cyan

hi LineNr    ctermfg=red
hi Statement ctermfg=red
hi Conditional ctermfg=red
hi Repeat ctermfg=red
hi Label ctermfg=red
hi Include ctermfg=red

hi PreProc ctermfg=red
hi Keyword ctermfg=red
hi Operator ctermfg=red
hi Type ctermfg=red

hi vimGroup ctermfg=yellow

hi pythonFunction ctermfg=cyan
hi pythonClass ctermfg=cyan
hi pythonClassVar ctermfg=green

" code folding
"" default fold code by indent block (makes sense in Python)
set foldmethod=indent
"" 236=#303030 151=#afd7af
highlight Folded ctermbg=236 ctermfg=151
augroup OpenAllFoldsOnFileOpen
        autocmd!
            autocmd BufRead * normal zR
        augroup END
"" unfold using space
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
"" remove stupid folding
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

"" set to auto read when a file is changed from the outside
set autoread

"" show line numbers
set number
set relativenumber

"" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

"" Turn on the WiLd menu
set wildmenu
"" Ignore compiled files
set wildignore=*.o,*~,*.pyc
"Always show current position
set ruler
"" Height of the command bar
set cmdheight=1
"" A buffer becomes hidden when it is abandoned
set hid
"" Configure backspace so it acts as it should act
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
"" Ignore case when searching
set ignorecase
"" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
hi Search cterm=NONE ctermfg=Green ctermbg=236
" Makes search act like search in modern browsers
set incsearch
"" For regular expressions turn magic on
set magic
"" Show matching brackets when text indicator is over them
set showmatch
"" How many tenths of a second to blink when matching brackets
set mat=2
" Highlight current line
set cursorline
hi CursorLine term=None cterm=None ctermbg=236
hi CursorLineNR cterm=None ctermfg=red ctermbg=236
"" Empty line hide ~ symbols
hi EndOfBuffer ctermbg=Black ctermfg=Black

" whitespace
"" indent = 4 space
filetype plugin indent on

"" Use spaces instead of tabs
set autoindent
set smartindent
set wrap "Wrap lines
set linebreak
set textwidth=80
set nolist
set tabstop=4
set shiftwidth=4
set expandtab

"" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"" auto remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

"" make divider less ugly
set fillchars=vert:│
set fillchars+=stl:–

"" split bars
hi VertSplit    ctermfg=Black  ctermbg=236
hi StatusLine   ctermfg=Black  ctermbg=Red
hi StatusLineNC ctermfg=Black  ctermbg=236

hi TabLineFill term=NONE cterm=NONE ctermfg=Black     ctermbg=236
hi TabLine     term=NONE cterm=NONE ctermfg=Green     ctermbg=236
hi TabLineSel  term=NONE cterm=NONE ctermfg=Green     ctermbg=Black

hi TabNum       term=NONE cterm=NONE ctermfg=Red ctermbg=236
hi TabWinNumaa  term=NONE cterm=NONE ctermfg=Red ctermbg=236
hi TabNumSel    term=NONE cterm=NONE ctermfg=Red ctermbg=Black
hi TabWinNumSel term=NONE cterm=NONE ctermfg=Red ctermbg=Black

" nerdtree
map <C-n> :NERDTreeToggle<CR>
"" automatically open with vim
autocmd vimenter * NERDTree
"" automatically open if no file provided
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"" automatically open with directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
"" close vim if only nerdtree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"" nerdtree close ? for help
let NERDTreeMinimalUI = 1
"" nerdtree highlight current line
let NERDTreeHighlightCursorline = 1
"" quit nerdtree upon opening file
let NERDTreeQuitOnOpen=1

" fzf
map ; :Files<CR>
let g:fzf_layout = { 'down': '~30%' }
"" feed fzf results from ag, which ignores .gitignore
let $FZF_DEFAULT_COMMAND='ag -g . --path-to-ignore ~/.ignore'

" tmuxline
let g:airline_theme='bubblegum'
let g:tmuxline_powerline_separators = 0

"\'a'    : '#S',
let g:tmuxline_preset = {
      \'a'    : '#H',
      \'b'    : '#(curl ifconfig.me)',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '#(date)',
      \'z'    : '♥ always ♥'}

let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '',
    \ 'right' : '',
    \ 'right_alt' : ' ',
    \ 'space' : ' '}

"" miscellaneous functions
" convert tabs to spaces
map <leader>t :%s/\t/    /g<CR>
" convert single quotes to double quotes (ocd rachel)
map <leader>' :%s/'/"/g<CR>
" mirror existing NERDTree
map <leader>m :NERDTreeMirror<CR>
" clear highlighting
map <leader>n :noh<CR>
" write and quit
map <leader>q :wq<CR>

" rename tabs to show tab number
" also display * if more than one tab and [+] if modified
if exists("+showtabline")
    function! MyTabLine()
        " start with '  ' to skip line number spacing
        let s = '%#TabLine#'
        let s .= '(・∀・)ノ   '
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let wn = tabpagewinnr(i,'$')

            let s .= (i== t ? '%#TabNumSel#' : '%#TabNum#')
            " start of tab number
            let s .= '▹'
            let s .= i
            " if more than one file open, add * else empty space
            let s .= (tabpagewinnr(i,'$') > 1 ? '°' : ' ')
            let s .= (i== t ? '%#TabWinNumSel#' : '%#TabWinNum#')

            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            " append current file name
            let s .= file
            " if current tab AND modified, display [+] else just ' '
            let s .= (i == t ? '%m ' : ' ')
            let i = i + 1
        endwhile
        let s .= '%#TabNum#'
        let s .= '  ヾ(・ω・*)'
        let s .= '%T%#TabLineFill#%='
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
endif

set tabpagemax=15

