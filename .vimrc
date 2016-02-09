" Plug {{{

call plug#begin('~/.vim/plugged')

  " General plugins {{{

  Plug 'Raimondi/delimitMate'
  Plug 'SirVer/ultisnips'
  Plug 'bling/vim-airline'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'godlygeek/tabular'
  Plug 'kien/ctrlp.vim'
  Plug 'majutsushi/tagbar'
  Plug 'matchit.zip', {'name': 'matchit'}
  Plug 'mileszs/ack.vim'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/syntastic'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'wellle/targets.vim'
  Plug 'Shougo/neocomplete'

  " }}}

  " PHP {{{

  Plug 'shawncplus/phpcomplete.vim'
  Plug 'arnaud-lb/vim-php-namespace'
  Plug 'vim-php/tagbar-phpctags.vim'

    " Drupal {{{

    Plug 'dsdeiz/vim-drupal-snippets'

    " }}}

  " }}}

  " Javascript {{{

  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'jelera/vim-javascript-syntax'
  Plug 'marijnh/tern_for_vim'

    " Typescript {{{

    Plug 'leafgarland/typescript-vim'

    " }}}

  " }}}

  " HTML {{{

  Plug 'mattn/emmet-vim'

  " }}}

  " Markdown {{{

  Plug 'plasticboy/vim-markdown'

  " }}}

  " CSS {{{

    " Stylus {{{
    Plug 'wavded/vim-stylus'

    " }}}

  " }}}

  " Rust {{{

  Plug 'rust-lang/rust.vim'

  " }}}

call plug#end()

" }}}

" Basic settings {{{

syntax on

set t_Co=256

set backspace=indent,eol,start
set vb t_vb=
set mouse=a

set fileformats=unix,dos
set fileformat=unix

set wildmode=list:longest,full
set wildignore=*.png,*.jpg,*.jpeg,*.gif,*.swp,*.swo,*/sites/*/files/**,.git,*.tar

set hidden

set colorcolumn=80

set autoindent
set backspace=indent,eol,start
set smarttab

set timeoutlen=700
set ttimeout
set ttimeoutlen=100

set incsearch

set scrolloff=5

set laststatus=2
set ruler
set showcmd

set display+=lastline

set fileformats+=mac

set listchars=trail:·,precedes:«,extends:»,tab:▸\ 

set history=1000

set switchbuf=useopen

set wrap
" set linebreak
" set breakindent

" }}}

" Layout settings {{{

set list

set shiftwidth=2
set expandtab
set softtabstop=2
set tabstop=2

set ignorecase
set smartcase

set number
set mousehide
set complete-=b
set complete-=u
set complete-=w
set completeopt-=preview
exec "set path=.,," . getcwd() . "/**"
set textwidth=80

set background=dark
colorscheme alduin

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

nnoremap j gj
nnoremap k gk

map Y y$

nnoremap <Leader>cd :cd $HOME/Sites<CR>:cd 
nnoremap <Leader>cp :cd $HOME/Projects<CR>:cd 

" A bit annoying.
nnoremap q: <Nop>

" Load session
nmap <Leader>ls :so $HOME/.vim/session.vim<CR>

nnoremap <Leader>sp :sp <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <Leader>ee :drop <C-R>=expand('%:p:h') . '/'<CR>

nnoremap <Leader>eg :e $MYGVIMRC<CR>
nnoremap <Leader>ev :e $MYVIMRC<CR>

nnoremap ' `

" }}}

" Autocommand settings {{{

autocmd VimLeave * mks! ~/.vim/session.vim

augroup php
  autocmd BufEnter *.install let b:syntastic_checkers=['php']
  " autocmd BufEnter *.test let b:syntastic_checkers=['php', 'phpcs']
  autocmd BufEnter *.inc let b:syntastic_checkers=['php']
  autocmd BufEnter *.module let b:syntastic_checkers=['php']
  autocmd BufEnter *.profile let b:syntastic_checkers=['php']
augroup END

autocmd BufRead PULLREQ_EDITMSG set tw=0

" }}}

" Plugin settings {{{

  " Syntastic {{{

  let g:syntastic_auto_loc_list=1
  let g:syntastic_php_checkers=['php']
  let g:syntastic_tex_checkers=['lacheck']
  let g:syntastic_php_phpcs_args="--standard=Drupal --extensions=php,module,inc,install,test,profile,theme"
  " let g:syntastic_quiet_messages=1
  let g:syntastic_mode_map = { 'mode': 'active',
        \ 'active_filetypes': ['ruby'],
        \ 'passive_filetypes': ['html'] }

  " Sometimes, I don't follow standards. :D
  nnoremap <Leader>st :SyntasticToggleMode<CR>

  " For angular.
  let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,
    \ "trimming empty <",
    \ "unescaped &" ,
    \ "lacks \"action",
    \ "is not recognized!",
    \ "discarding unexpected"
    \ ]

  " Allow jumping between errors on buffers.
  let g:syntastic_always_populate_loc_list=1

  " }}}

  " Ack {{{

  " let g:ackprg="ack -H --nocolor --nogroup --column"
  let g:ackprg="ag --nogroup --nocolor --column"
  nnoremap <Leader>ag :Ack! 

  " }}}

  " Tagbar {{{

  nnoremap <Leader>t :TagbarToggle<CR>

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

  let g:ctrlp_working_path_mode=''
  let g:ctrlp_follow_symlinks=1

  " Ignore *.png, *.gif, *.jpg, and *.jpeg files.
  " let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files | grep -v "\.\(png\|gif|jp\(e\)\?g\)\$"', 'find -L %s -type f | grep -v "\.jpg$"']
  " let g:ctrlp_user_command = 'find -L %s -type f -not -path "sites/default/vendor" | grep -v "\.\(png\|gif|jp\(e\)\?g\)\$"'
  let g:ctrlp_user_command = 'ag -f %s -l --nocolor -g "" --ignore="*.png" --ignore="*.jpeg" --ignore="*.jpg" --ignore="*.gif"'

  " }}}

  " Indent Guides {{{

  let g:indent_guides_guide_size=1
  let g:indent_guides_enable_on_startup=0
  let g:indent_guides_auto_colors=1

  " }}}

  " NERDTree {{{

  nnoremap <Leader>n :NERDTreeToggle<CR>

  " }}}

  " PHP Namespace {{{

  inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
  noremap <Leader>u :call PhpInsertUse()<CR>

  " }}}

  " Javascript Libraries Syntax {{{

  " let g:used_javascript_libs = 'angularjs,angularui'

  " }}}

  " Javascript {{{

  let g:javascript_conceal=1

  " }}}

  " {{{

  let g:airline_powerline_fonts=1

  " }}}

" }}}

" Sessions {{{

set sessionoptions-=options
set sessionoptions-=buffers
set sessionoptions-=help
set sessionoptions-=blank

" }}}

" Drupal helpers {{{

inoremap <Leader>fn <C-R>=expand("%:t:r:r")<CR>
nnoremap <Leader>fn "=expand("%:t:r:r")<CR>p

" }}}

" Hilights {{{

" hi Normal ctermbg=NONE guibg=NONE

" }}}

" vim: foldmethod=marker
