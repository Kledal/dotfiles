set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ggreer/the_silver_searcher'
Plugin 'tpope/vim-sensible'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-rails'
Plugin 'slim-template/vim-slim'
Plugin 'mileszs/ack.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'killphi/vim-ruby-refactoring'
Plugin 'tmhedberg/matchit'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-endwise'
Plugin 'christoomey/vim-tmux-navigator'
call vundle#end()            " required

execute pathogen#infect()
set encoding=utf-8
syntax on
filetype plugin indent on         " load file type plugins + indentation

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set showmatch                     " Show matching brackets/parenthesis

set tabstop=2 shiftwidth=2        " a tab is two spaces (or set this to 4)
set expandtab                     " use spaces, not tabs (optional)
set backspace=2                   " backspace through everything in insert mode"
set autoindent                    " match indentation of previous line
set autoread                      " refresh a file that is modified by another program

set incsearch                     " Find as you type search
set hlsearch                      " Highlight search terms
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set foldmethod=indent             "fold based on indent
set foldnestmax=3                 "deepest fold is 3 levels
set nofoldenable                  "dont fold by default

set hidden                        " Handle multiple buffers better.
set title                         " Set the terminal's title
set number
"set relativenumber                        " Show line numbers.
set ruler                         " Show cursor position.
set wildmode=list:longest         " Complete files like a shell.
set wildmenu                      " Enhanced command line completion.
set wildignore=*.o,*.obj,*~       "stuff to ignore when tab completing
set novisualbell
set noerrorbells
set history=1000                  " Store lots of :cmdline history

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=/tmp                " Keep swap files in one location
set timeoutlen=500
" fast redrawing
set ttyfast

set laststatus=2                  " Show the status line all the time
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
colorscheme onedark
let base16colorspace=256
set t_Co=256                      " Set terminal to 256 colors
set background=dark

autocmd BufWritePre * :%s/\s\+$//e " auto remove trailing whitespace

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
autocmd StdinReadPre * let s:std_in=1

" Syntastic config
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" #######################################
" Keybindings
" #######################################
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

noremap <Space> :noh<CR>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
let mapleader = ","

noremap <C-S> :update<CR>
noremap <D-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" #######################################
" Plugin configuration
" #######################################
" CTRL-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Fugitive
set statusline+=%{fugitive#statusline()}
" airline options
let g:airline_powerline_fonts=1
"let g:airline_left_sep=''
"let g:airline_right_sep=''
let g:airline_theme='papercolor'
let g:airline#extensions#hunks#enabled=0

" Vim-ruby-refactoring
:nnoremap <leader>rap  :RAddParameter<cr>
:nnoremap <leader>rcpc :RConvertPostConditional<cr>
:nnoremap <leader>rel  :RExtractLet<cr>
:vnoremap <leader>rec  :RExtractConstant<cr>
:vnoremap <leader>relv :RExtractLocalVariable<cr>
:nnoremap <leader>rit  :RInlineTemp<cr>
:vnoremap <leader>rrlv :RRenameLocalVariable<cr>
:vnoremap <leader>rriv :RRenameInstanceVariable<cr>
:vnoremap <leader>rem  :RExtractMethod<cr>

" ####### The Silver Searcher ########
let g:ackprg = 'ag --nogroup --nocolor --column'

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
