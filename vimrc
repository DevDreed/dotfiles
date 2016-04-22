" ========================================================================
" Vundle stuff
" ========================================================================
set nocompatible " Required by vundle
filetype off     " Required by vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My bundles
Plugin 'vim-scripts/ack.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'tomtom/tcomment_vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'sickill/vim-pasta'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'sheerun/vim-polyglot'
Plugin 'Valloric/YouCompleteMe'
Plugin 'wincent/Command-T'
Plugin 'scrooloose/syntastic'
Plugin 'grvcoelho/vim-javascript-snippets'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'luochen1990/rainbow'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-vinegar'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdcommenter'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" color schemes
Bundle "daylerees/colour-schemes", { "rtp": "vim/" }
Plugin 'nanotech/jellybeans.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/vilight.vim'
Plugin 'vim-scripts/CSApprox'
" All of your Plugins must be added before the following line
call vundle#end()            " required

"Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

" Enable folding
"set foldmethod=syntax
"function! JavaScriptFold()
    "setl foldmethod=syntax
    "setl foldlevelstart=1
    "syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    "function! FoldText()
        "return substitute(getline(v:foldstart), '{.*', '{...}', '')
    "endfunction
    "setl foldtext=FoldText()
"endfunction
"au FileType javascript call JavaScriptFold()
"au FileType javascript setl fen

set nocompatible

"NERDTree Setup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-d> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" prevents security exploits dealing with modelines in files
set modelines=0

" expands tabs to 4 spaces, etc
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation rules
set autoindent
set smartindent


" Random stuff from http://stevelosh.com/blog/2010/09/coming-home-to-vim/#making-vim-more-useful
set scrolloff=3
set showmode
set visualbell
set cursorline
if has("gui_running")
    set ttyfast
endif
set backspace=indent,eol,start

" Auto cd to current file's directory
autocmd BufEnter * lcd %:p:h

" More useful command-line-like tab completion
set wildmenu

"Auto-completion menu
set wildmode=list:longest

"Show command in bottom right portion of the screen
set showcmd

" Display current cursor position in lower right corner
set ruler

" Switch between buffers without saving
set hidden

" Always show status line
set laststatus=2

" Remap leader key from \ to space bar
let mapleader = ","

" Remaps / search key to use standard regex instead of vim regex
nnoremap / /\v
vnoremap / /\v

" If searching all lowercase, search case-insensitive.
" If any characters are uppercase, search case-sensitive.
set ignorecase
set smartcase

" %s/foo/bar/ will assume %s/foo/bar/g 
set gdefault

" Highlight results as you search
set incsearch
set showmatch
set hlsearch

" Clear a search by typing <space>k
nnoremap <leader>k :noh<cr>

" Turn on line numbers by typing ,num
nnoremap <leader>num :set number<cr>
nnoremap <leader>rnum :set relativenumber<cr>
nnoremap <leader>nonum :set nonumber<cr>:set norelativenumber<cr>

" Remaps % to tab to navigate matching brackets
nnoremap <tab> %
vnoremap <tab> %

" Line-wrapping options
set wrap
set textwidth=79
set formatoptions=qrn1

" Use <leader>H to toggle highlighting lines over 80 chars
nnoremap <leader>H :call<SID>LongLineHLToggle()<cr>
hi OverLength ctermbg=none cterm=none
match OverLength /\%>80v/
fun! s:LongLineHLToggle()
    if !exists('w:longlinehl')
        let w:longlinehl = matchadd('ErrorMsg', '.\%>80v', 0)
        echo "Long lines highlighted"
    else
        call matchdelete(w:longlinehl)
        unl w:longlinehl
        echo "Long lines unhighlighted"
    endif
endfunction

" Navigate Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Disables arrow keys in normal mode to enforce use of hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Remap F1 to Esc to avoid accidentally opening help docs
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Remap jk to do same thing as <ESC> when in insert mode
inoremap jk <ESC>

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

" Airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" set guifont=Inconsolata:h16 "http://www.levien.com/type/myfonts/inconsolata.html
" set guifont=Inconsolata\ for\ Powerline:h17 "https://github.com/Lokaltog/powerline-fonts
" set guifont=Droid\ Sans\ Mono:h14 "http://damieng.com/blog/2008/05/26/envy-code-r-preview-7-coding-font-released
" set guifont=Source\ Code\ Pro:h14 "http://blogs.adobe.com/typblography/2012/09/source-code-pro.html
" set guifont=Hermit:h15 "http://pcaro.es/p/hermit/
" set guifont=CosmicSansNeueMono:h18 "http://openfontlibrary.org/en/font/cosmic-sans-neue-mono
set guifont=Hack:h14 "https://github.com/chrissimpkins/Hack

" Set linespacing
set linespace=5

" Set color scheme
colorscheme freshcut

" Makes eol/tab chars not get ugly highlighting with colour-schemes bundle
hi NonText guibg=bg guifg=#444444

" Hide files in netrw file tree based on .gitignore rules
let g:netrw_list_hide = netrw_gitignore#Hide() . '\.git$'

" Settings for Indent Guides plugin (https://github.com/nathanaelkane/vim-indent-guides)
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

" Crontab uses tmp files to edit, so backup rules must change. (See
" .bash_profile for $VIM_CRONTAB alias stuff.)
if $VIM_CRONTAB == "true"
    set nobackup
    set nowritebackup
endif

" Remap <leader>d to close current buffer
nnoremap <leader>d :bd<cr>

" Remap <leader>s to close current buffer without destroying current split
nnoremap <leader>s :b#<bar>bd#<cr>

" Remap <leader>D to force-close current buffer
nnoremap <leader>D :bd!<cr>

" Remap <leader>w to switch splits
nnoremap <leader>w <C-w>w<cr>

" Tidy JSON - http://lumberjaph.net/perl/2009/02/17/tidify-a-json-in-vim.html 
map <leader>jt  <Esc>:%!python -m json.tool<CR>

" inoremap <M-o> <Esc>o
" inoremap <C-j> <Down>

" Rules for vim-ragtag
let g:ragtag_global_maps = 1

nnoremap 0 ^
vnoremap 0 ^

" <leader>o/O adds a blank line above or below current line
map <leader>o :set paste<CR>m`o<Esc>``:set nopaste<CR>
map <leader>O :set paste<CR>m`O<Esc>``:set nopaste<CR>

" <leader>p/P delete a line above or below (only if blank)
map <leader>p m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
map <leader>P m`:silent -g/\m^\s*$/d<CR>``:noh<CR>

" Hide MacVim's GUI task bar on load
if has("gui_running")
    set guioptions=egmrt
endif

" Leader shortcut to replace 4 spaces with a tab
vnoremap <leader>st :s/    /\t/<CR>

" Leader shortcut to replace a tab with 4 spaces
vnoremap <leader>ts :s/\t/    /<CR>

" backup and swap rules
set noswapfile
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup

" Have new buffers open in tabs
set switchbuf+=usetab,newtab

" Change default YouCompleteMe diagnostic key command to maintain preexisting <leader>d setting
let g:ycm_key_detailed_diagnostics = '<leader>yd'

set lazyredraw

" Directory for custom snippets
let g:UltiSnipsSnippetDirectories=["my_snippets"]

" Snippet insert with Cmd-J and Shift-Cmd-J
let g:UltiSnipsExpandTrigger="<D-j>"
let g:UltiSnipsJumpForwardTrigger = "<D-j>"
let g:UltiSnipsJumpBackwardTrigger = "<s-D-j>"

" because apparently *.md is also a Modula-2 file, which I'm never going to edit
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Trying to train myself out of using tabs vs buffers
map <leader>] :bnext<CR>
map <leader>[ :bprevious<CR>

" Ignore node_modules directory
set wildignore+=node_modules/*

" JSX syntax in .js files
let g:jsx_ext_required = 0

" List current buffers with <leader>l
map <leader>l :ls<CR>

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" javascript-libraries-syntax.vim settings
let g:used_javascript_libs = 'underscore,backbone,react,flux,jasmine,chai'

".vimrc
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" `gf` will open JS file paths that don't end in .js (a la CommonJS/ES6 modules)
set suffixesadd+=.js

" turn on rainbow plugin
let g:rainbow_active = 1

" use ag instead of ack
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" easytags options
let g:easytags_async = 1
