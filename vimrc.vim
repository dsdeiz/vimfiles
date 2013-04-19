execute pathogen#infect()

filetype plugin indent on

" Basic settings {{{

syntax on

set backspace=indent,eol,start
set vb t_vb=
set mouse=a

set fileformats=unix,dos
set fileformat=unix

set wildmenu
set wildmode=list:longest,full
set wildignore=*.png,*.jpg,*.jpeg,*.gif,*.swp,*.swo,sites/default/files/**,.git

set hidden

set colorcolumn=80

" }}}

" Layout settings {{{

set laststatus=2
set list
set listchars=tab:»\ ,trail:·

set shiftwidth=2
set expandtab
set softtabstop=2
set tabstop=2
set autoindent

set ignorecase

set number
set nohlsearch
set incsearch
set showcmd
set ruler
set mousehide
set nocul
set complete-=i
set complete-=b
set complete-=u
set complete-=w
set completeopt-=preview
exec "set path=.,," . getcwd() . "/**"
set textwidth=80

colorscheme jellybeans

" }}}

" Folding settings {{{

set foldenable
set foldmethod=syntax
set foldlevel=99
set foldcolumn=0

" }}}

" Keybind settings {{{

let mapleader=","
let maplocalleader=","

inoremap jk <esc>
" cnoremap jk <esc>

" Train self to avoid <Esc> key.
inoremap <esc> <nop>
" cnoremap <esc> <nop>

nnoremap j gj
nnoremap k gk
" Hard mode
" nnoremap h <Nop>
" nnoremap j <Nop>
" nnoremap k <Nop>
" nnoremap l <Nop>

map Y y$

nnoremap <Leader>cd :cd $HOME/Sites<Enter>:cd 

" A bit annoying.
nnoremap q: <Nop>

" Load session
nmap <Leader>ls :so $HOME/.vim/session.vim<CR>

nnoremap <Leader>sp :sp <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <Leader>ee :e <C-R>=expand('%:p:h') . '/'<CR>

nnoremap <Leader>eg :e $MYGVIMRC<CR>
nnoremap <Leader>ev :e $MYVIMRC<CR>

" }}}

" Plugin settings {{{

  " Ack {{{

  let g:ackprg="ack -H --nocolor --nogroup --column"

  " }}}

  " Tabularize {{{

  nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
  vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
  nmap <Leader>a: :Tabularize /:<CR>
  vmap <Leader>a: :Tabularize /:<CR>
  nmap <Leader>az: :Tabularize /:\zs<CR>
  vmap <Leader>az: :Tabularize /:\zs<CR>
  nmap <Leader>a> :Tabularize /=><CR>
  vmap <Leader>a> :Tabularize /=><CR>

  " Format the text as 4 fields with <Space> as the delimiter.
  " :Tabularize /\s*\$\w*\s*

  " }}}

  " CtrlP {{{

  let g:ctrlp_working_path_mod='rw'

  " }}}

  " neocomplcache {{{

  inoremap <expr><C-g>     neocomplcache#undo_completion()
  inoremap <expr><C-l>     neocomplcache#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplcache#close_popup()
  inoremap <expr><C-e>  neocomplcache#cancel_popup()

  " Temporary
  let g:UltiSnipsExpandTrigger="<c-s-tab>"

  " }}}

" }}}

" Sessions {{{

set ssop-=options
set ssop-=buffers
set ssop-=help
set ssop-=blank

" }}}

" Drupal helpers {{{

inoremap <Leader>fn <C-R>=expand("%:t:r:r")<CR>
nnoremap <Leader>fn "=expand("%:t:r:r")<CR>p

" }}}

" vim: foldmethod=marker
