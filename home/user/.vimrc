" vim: foldmethod=marker
" General options {{{1
set nocompatible
" set lazyredraw
" automaticaly close preview window {{{2
autocmd CompleteDone * pclose
:set matchpairs+=<:>
" colors {{{2
set t_Co=256
colorscheme afterglow
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/home/eozd/anaconda3/bin/python3'
" Easy project navigation with :find command {{{2
set path=.\**
set wildmenu
" diff settings {{{2
set diffopt=filler,vertical
syntax on
set hlsearch
" backup {{{2
set undofile
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
" general stuff {{{2
set mouse-=a
set listchars=tab:>\ ,eol:¬
set nowrap
set colorcolumn=120
set tabpagemax=20
set bs=2
set modifiable
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
"ignore case when searching {{{2
set ignorecase
set smartcase
" numbering {{{2
set number
" Vundle {{{1
set rtp+=~/.vim/bundle/Vundle.vim
filetype off
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'unblevable/quick-scope'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'honza/vim-snippets'
Plugin 'coot/CRDispatcher'
Plugin 'coot/EnchantedVim'
Plugin 'mileszs/ack.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'lervag/vimtex'
Plugin 'numirias/semshi'
Plugin 'andymass/vim-matlab'
Plugin 'djoshea/vim-matlab-fold'


if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

call vundle#end()
filetype plugin indent on
" }}}
" enchanted vim very magic options {{{1
let g:VeryMagic = 0
nnoremap / /\v
nnoremap ? ?\v
vnoremap / /\v
vnoremap ? ?\v
let g:VeryMagicSubstituteNormalise = 1
let g:VeryMagicSubstitute = 1
let g:VeryMagicGlobal = 1
let g:VeryMagicVimGrep = 1
let g:VeryMagicSearchArg = 1
let g:VeryMagicFunction = 1
let g:VeryMagicHelpgrep = 1
let g:VeryMagicRange = 1
let g:VeryMagicEscapeBackslashesInSearchArg = 1
let g:SortEditArgs = 1
" Delimitmate {{{1
let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_expand_cr = 1
let delimitMate_balance_matchpairs = 1

" Neosnippet {{{1
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = '~/.vim/bundle/vim-snippets/snippets'
" map tab to snippet expansion
imap <C-Space> <Plug>(neosnippet_expand_or_jump)
imap <Tab> <Tab>
" smap <Tab> <Plug>(neosnippet_expand_or_jump)
" xmap <Tab> <Plug>(neosnippet_expand_target)
" QuickScope function to only highlight when f/F/t/T is pressed. {{{1
function! Quick_scope_selective(movement)
    let needs_disabling = 0
    if !g:qs_enable
        QuickScopeToggle
        redraw
        let needs_disabling = 1
    endif
    let letter = nr2char(getchar())
    if needs_disabling
        QuickScopeToggle
    endif
    return a:movement . letter
endfunction
let g:qs_enable = 0
for i in  [ 'f', 'F', 't', 'T' ]
    execute 'noremap <expr> <silent>' . i . " Quick_scope_selective('". i . "')"
endfor
" Tag movement {{{2
nmap Z viW<C-]>
autocmd filetype help nmap <buffer> Z viWhol<C-]>
" leader mappings {{{2
:let mapleader = " "
:let maplocalleader = "&"
nnoremap <leader>w :w<CR>
nmap <leader>l :set list!<CR>
nmap <leader>u :diffupdate<CR>
nnoremap <leader>h :nohlsearch<CR>
nmap <leader>C :source $MYVIMRC<CR>
nmap <leader>v :e ~/.vimrc<cr>
nmap <leader>e :Explore<CR>
nmap <leader>q :windo if &buftype == "locationlist" \| quit \| elseif &buftype == "quickfix"  \| quit \| endif<CR>
nmap Q q:
" Deleting lines {{{2
inoremap <C-U> <C-G>u<C-U>
" window navigation {{{2
set splitright
if has('nvim')
	nmap <BS> <C-W>h
endif
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
" Y behaviour {{{2
nnoremap Y y$
" buffer navigation {{{2
nmap <C-s> :bp<CR>
nmap <C-N> :bn<CR>
" CTRL-P behaviour {{{1
nmap <C-f> :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v(\.git|\.gh|\.svn|\.stack-work|build)',
	\ 'file': '\v\.(o|so|pdf)$',
	\ }
let g:ctrlp_reuse_window = 'netrw\|help'
let g:ctrlp_regexp = 1
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_files = 0
let g:ctrlp_cache_dir = $HOME.'/.vim/cache'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_arg_map = 1
" netrw behaviour {{{1
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_winsize=20
" Ack {{{1
let g:ackprg = "ag --vimgrep"
let g:ack_default_options = " -s -H --nocolor --nogroup --column --smart-case --follow"
let g:ackhighlight = 1
" Enable matchit {{{1
:source $VIMRUNTIME/macros/matchit.vim
" airline conf {{{1
let g:airline_extensions = ['branch', 'ctrlp']
let g:airline_exclude_filetypes = ["qf"]
let g:airline_exclude_preview = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
set ttimeoutlen=-1

" abbreviations {{{1
iabbrev teh the

" indenting/tabs {{{2
set shiftwidth=4
set sts=4
set expandtab
set softtabstop=0
set smarttab
set autoindent " always set autoindenting on
set smartindent
set tabstop=4

let g:semshi#mark_selected_nodes = 0
let g:semshi#error_sign = v:false
