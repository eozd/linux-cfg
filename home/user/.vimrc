" vim: foldmethod=marker
" General options {{{1
set encoding=utf8
set nocompatible
" set lazyredraw
" automaticaly close preview window {{{1
autocmd CompleteDone * pclose
:set matchpairs+=<:>
" colors {{{1
set t_Co=256
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/home/eozd/miniconda3/envs/guitar/bin/python3'
" Easy project navigation with :find command {{{1
set path=.\**
set wildmenu
" diff settings {{{1
set diffopt=filler,vertical
syntax on
set hlsearch
" backup {{{1
set undofile
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
" general stuff {{{1
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
"ignore case when searching {{{1
set ignorecase
set smartcase
" numbering {{{1
set number
" Ale {{{1
nmap rtp
" Vundle {{{1
set rtp+=~/.vim/bundle/Vundle.vim
filetype off
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'Raimondi/delimitMate'
Plugin 'unblevable/quick-scope'
Plugin 'coot/CRDispatcher'
Plugin 'coot/EnchantedVim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'numirias/semshi'
Plugin 'rust-lang/rust.vim'
Plugin 'cespare/vim-toml'
Plugin 'morhetz/gruvbox'
Plugin 'neoclide/coc.nvim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'TimUntersberger/neogit'
Plugin 'sindrets/diffview.nvim'
call vundle#end()

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

syntax enable
filetype plugin indent on
" }}}
" colorscheme {{{1
let g:gruvbox_italic=1
colorscheme gruvbox
let g:airline_theme='gruvbox'
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
" Tag movement {{{1
nmap Z viW<C-]>
autocmd filetype help nmap <buffer> Z viWhol<C-]>
" leader mappings {{{1
:let mapleader = " "
:let maplocalleader = "&"
nnoremap <leader>w :w<CR>
nmap <leader>l :set list!<CR>
nnoremap <leader>h :nohlsearch<CR>
nmap <leader>C :source $MYVIMRC<CR>
nmap <leader>V :e ~/.vimrc<cr>
nmap <leader>v :vsp<CR>
nmap <leader>s :split<CR>
nmap <leader>q :q<CR>
" nmap <leader>q :windo if &buftype == "locationlist" \| quit \| elseif &buftype == "quickfix"  \| quit \| endif<CR>
nmap Q q:
" Deleting lines {{{1
inoremap <C-U> <C-G>u<C-U>
" window navigation {{{1
set splitright
if has('nvim')
	nmap <BS> <C-W>h
endif
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" Y behaviour {{{1
nnoremap Y y$
" buffer navigation {{{1
nmap <C-s> :bp<CR>
nmap <C-N> :bn<CR>
" Enable matchit {{{1
:source $VIMRUNTIME/macros/matchit.vim
" airline conf {{{1
let g:airline_extensions = ['branch']
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
" indenting/tabs {{{1
set shiftwidth=4
set sts=4
set expandtab
set softtabstop=0
set smarttab
set autoindent " always set autoindenting on
set smartindent
set tabstop=4
" semshi {{{1
let g:semshi#mark_selected_nodes = 0
let g:semshi#error_sign = v:false
" rustfmt {{{1
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'
" pmenu colors {{{1
highlight Pmenu ctermfg=250 ctermbg=235 guifg=#ffc26f guibg=#3a3a3a
highlight PmenuSel ctermfg=250 ctermbg=131 guifg=#3a3a3a guibg=#eba04d
" GitGutter {{{1
set updatetime=100
command! Gutter GitGutterQuickFix | copen
" netrw {{{1
let g:netrw_winsize = 15
let g:netrw_liststyle = 3
let g:netrw_altv=1
nmap <leader>e :Lexplore<CR>
" coc.nvim {{{1
set cmdheight=1
set shortmess+=c
set signcolumn=number
inoremap <silent><expr> <c-space> coc#refresh()
" use :CocDiagnostics as weell
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-y> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-y> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-y> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nmap <leader>d :CocCommand rust-analyzer.openDocs<CR>

" FZF behaviour {{{1
" let g:fzf_preview_window = []
nmap <C-p> :Files<CR>
nmap <C-e> :Buffers<CR>
let g:fzf_layout = { 'down': '40%' }
let g:fzf_history_dir = '~/.local/share/fzf-history'

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--info=inline']}), <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
nmap <leader>r :Rg 
