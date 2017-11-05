"************************************************************************

" Title: vim-gt-solarized - Vom Gnome Terminal Dark Solarized  
" Author: Kayro Pamio, https://github.com/jkayro 
" Description: For gnome-terminal. It is not suitable for gui.

"******************************** init *************************************

set nocompatible "required
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

"****************************** pathogen ***********************************

call pathogen#infect()
nnoremap <F2> :call pathogen#helptags()<CR> 

"************************** defaults settings ******************************

syntax on
syntax enable
filetype plugin indent on

set omnifunc=syntaxcomplete#Complete
set completeopt-=preview
set number                          "Line numbers are good
set backspace=indent,eol,start      "Allow backspace in insert mode
set history=1000                    "Store lots of :cmdline history
set showcmd                         "Show incomplete cmds down the bottom
set showmode                        "Show current mode down the bottom
set gcr=a:blinkon0                  "Disable cursor blink
set visualbell                      "No sounds
set autoread                        "Reload files changed outside vim
set linespace=4
set noswapfile
set nobackup
set nowb
set nowrap                          "Don't wrap lines
set linebreak                       "Wrap lines at convenient points
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set tabstop=4
set expandtab
set timeoutlen=100 ttimeoutlen=0    "remove ESC delay
set comments=sl:/*,mb:\ *,elx:\ */  "c comment style
set autoread 

"right margin. default: 76 columns 
"use Ctrl+l to enable/disable
set colorcolumn=0
highlight ColorColumn ctermbg=darkgray

"disable markdown folding
let g:vim_markdown_folding_disabled = 1

"**************************** identation ***********************************

autocmd FileType c,cpp :set cindent
autocmd FileType c,cpp :setf c
autocmd FileType c,cpp :set expandtab

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1    
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype html setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype php setlocal ts=4 sw=4 sts=0 expandtab
autocmd FileType css,scss set iskeyword=@,48-57,_,-,?,!,192-255

"************* fix syntax highlighting for large html file ***************** 

"look let c_minlines=600 in:
"http://vim.wikia.com/wiki/Fix_syntax_highlighting

autocmd BufEnter * :syntax sync fromstart

"###########################################################################
"
"                             PLUGINS  
"
"###########################################################################

"Signature background color
hi SignColumn ctermbg=8 
"https://github.com/kshenoy/vim-signature

"*********************** solarized colorscheme *****************************
set background=dark
set t_Co=16
colorscheme solarized

"*************************** syntastic *************************************

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set statusline+=%{fugitive#statusline()}

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"To disable warnings use: 
let g:syntastic_quiet_messages={'level':'warnings'}

let g:syntastic_mode_map = 
\{ 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

"Ctrl-w + e shall enable checking
"Ctrl-w + f shall disable checking 

nnoremap <C-w>e :SyntasticToggleMode<CR>

"https://github.com/vim-syntastic/syntastic

"***************************** CtrlP ***************************************

set runtimepath^=~/.vim/bundle/ctrlp.vim

"************************** vim-airline ************************************

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'aurora_solarized'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ' ☰'
let g:airline_symbols.notexists = ' +' 
let g:airline_section_warning = 
            \airline#section#create(['%{strftime("%H:%M")}'])


"********************** bug fix syntax-css3 ********************************

augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
augroup END

:highlight VendorPrefix guifg=#00ffff gui=bold
:match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/

"http://vimawesome.com/plugin/better-css-syntax-for-vim


"###########################################################################
"
"                                 CUSTOM  
"
"###########################################################################


"cicle buffers: alt+left / alt+right
:nmap <M-Left> :bprev<CR>
:nmap <M-Right> :bnext<CR>

"scroll screen: ctrl+up / ctrl+down
map <C-Down> <C-E> 
map <C-Up> <C-Y>

"open explore in: :.
"cmap . <Esc>:Explore<CR>

"************************ search buffer (c) ********************************

let g:searchant_map_stop = 0
let g:searchant_all = 0

"clear pattern search highlight
nmap c <Plug>SearchantStop

"highlight all
nnoremap <F3> :set hlsearch!<CR>

"************************ persistent undo **********************************

"Keep undo history across sessions, by storing in file.
"Only works all the time.

if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

"******************* replace cursor on change mode *************************

"help for xfce and others
"http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes

"gnome-terminal 3.16+
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

"************ relative or absolute lines numbers (ctrl+n) ******************

function! NumberToggle()
    if(&nu == 1)
        set nu!
        set rnu
    else
        set nornu
        set nu
    endif
endfunction

nnoremap <C-n> :call NumberToggle()<CR> 

"***************************** right line **********************************

function! RLine()
    if(&colorcolumn == 0)
        set colorcolumn=77
    else
        set colorcolumn=0
    endif
endfunction

nnoremap <C-l> :call RLine()<CR> 

