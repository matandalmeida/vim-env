"==============================================================================================="
"URL: https://github.com/matandalmeida/vim-env.git"
"Authors: https://github.com/matandalmeida"
"Description: This is a basic version of my vimrc that I use for my work," 
"			  which can serve as a template for you to use as a base for"
"		      your vim environments."
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
execute pathogen#infect() 
filetype plugin indent on

syntax on

"------------------------------------------------------------
" Colors
set term=xterm
set t_Co=256
colorscheme monokai

"------------------------------------------------------------
set hidden
set confirm
set autowriteall
 
"Better command-line completion
set wildmenu
set showcmd
set hlsearch
set nomodeline
set incsearch 
 
"------------------------------------------------------------
"Use case insensitive search, except when using capital letters
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set wildmode=full 
"Tags configuration
map <C-T> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-D> :rightb vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"Use visual bell instead of beeping when doing something wrong
set visualbell
 
"And reset the terminal code for the visual bell. If visualbell is set, and
"this line is also included, vim will neither flash nor beep. If visualbell
"is unset, this does nothing.
set t_vb=
 
"Enable use of the mouse for all modes
set autoread
 
"Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
 
"Display line numbers on the left
set number
 
"Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
 
"Use <F11> to toggle between paste and nopaste
set pastetoggle=<F11>
 
"------------------------------------------------------------
"Indentation options {{{1
"
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
 
"Indentation settings for using hard tabs for indent. Display tabs as
"four characters wide.
"set shiftwidth=4
"set tabstop=4
 
 
"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
map Y y$
nnoremap <S-right> gt
nnoremap <S-left> gT
nnoremap <S-L> gt
nnoremap <S-H> gT

" Function Keys Mappings
nnoremap <F3> :nohl<CR>
map      <F4> :redraw!<CR>
nnoremap <F5> <C-W>vgf

" Moving between buffers
nnoremap <C-right> <C-W>l
nnoremap <C-left> <C-W>h
nnoremap <C-down> <C-W>j
nnoremap <C-up> <C-W>k

nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k

map <leader>bt :bufdo tab split<CR>

" Copy Selection
vmap <F7> "+ygv"zy`>

" Paste 
nmap <F7> "zgP
nmap <S-F7> "zgp
imap <F7> <C-r><C-o>z
vmap <C-F7> "zp`
cmap <F7> <C-r><C-o>z

" Moving line up or down
nnoremap <A-down> :m .+1<CR>==
nnoremap <A-up> :m .-2<CR>==
inoremap <A-down> <Esc>:m .+1<CR>==gi
inoremap <A-up> <Esc>:m .-2<CR>==gi
vnoremap <A-down> :m '>+1<CR>gv=gv
vnoremap <A-up> :m '<-2<CR>gv=gv

autocmd FocusGained * let @z=@+

inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y

" Reference to current directory in command mode
cmap dir %:p:h

" Match close brace Mappings
set showmatch
set matchtime=5

inoremap } }<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
inoremap ] ]<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
inoremap ) )<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a

" Folding Mappings
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

augroup indentrc
  au BufReadPre  * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
  au BufRead * normal zR
augroup END



"--------------------- Syntax eneble ---------------------

" Actionscript
augroup actionscript_folding
  au!
  au BufNewFile,BufRead *.as   setf actionscript 
  au BufNewFile,BufRead *.vsif set  syntax=actionscript
augroup END

" JavaScript
let g:javascript_plugin_jsdoc = 1
augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END

" TCL
augroup tcl_folding
  au!
  au BufNewFile,BufRead *.tcl set syntax=tcl
augroup END

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

"------------------------------------------------------------

"
"SystemVerilog Assertions
let mapleader=","
nmap <leader>a o: assert property (<CR>@(posedge clk)<CR><CR>);<Esc><Up><Up><Up>I<Space><Left>
nmap <leader>d o$display($time,"");<Left><Left><Left>
nmap <F5> :!irun -sv -assert +access+rw -timescale 1ns/1ns *.v<CR>
map <F11> :let &background = ( &background == "dark" ? "light" : "dark" )<CR>

"---- Enable menu in terminal mode
if !has('gui_running')
  source $VIMRUNTIME/menu.vim
  set wildmenu
  set cpoptions-=<
  set wildcharm=<C-Z>
  map <F4> :emenu <C-Z>
endif

