if executable('pyenv')
  let g:python_host_prog = systemlist('pyenv which python2')[0]
  let g:python3_host_prog = systemlist('pyenv which python3')[0]
endif

"===============================================================================
" Plugin framework
"===============================================================================

" Installing vim-plug see https://github.com/junegunn/vim-plug/wiki/faq
"
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Make sure you use single quotes
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin('~/.local/share/nvim/plugged')
" Required by some other plugins
Plug 'Shougo/vimproc.vim', { 'do' : 'make' }

" Colorscheme
Plug 'chriskempson/base16-vim'

" Linting and building
Plug 'neomake/neomake'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Auto-completion
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'fishbullet/deoplete-ruby'
Plug 'Shougo/deoplete-rct'
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Fuzzy finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-update-rc' }
Plug 'junegunn/fzf.vim'

" Directory tree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Git plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Automatically close pairs
Plug 'jiangmiao/auto-pairs'

" Indentation guide
Plug 'nathanaelkane/vim-indent-guides'

Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
call plug#end()

"===============================================================================
" General configurations
"===============================================================================

" Behavioral
"----------------------------------------

""
" Files and directories (vim related)
"
set nobackup
set noswapfile
set undofile
set undolevels=2000
set autowriteall


""
" Indentation
"
set expandtab
set shiftwidth=4
set tabstop=4


""
" Search
"
set ignorecase
set smartcase


""
" Spell checking
"
set spell
set spelllang=en_us


""
" Input timeout
"
set ttimeout
set ttimeoutlen=100

""
" Miscellaneous
"
set completeopt+=noinsert             " causes deoplete to select first choice
set hidden                            " enable multiple modified buffer
set omnifunc=syntaxcomplete#Complete  " turn on builtin auto-completion
set switchbuf=useopen,usetab,newtab   " switching buffers behavior


" Visual
"----------------------------------------

""
" Folding
"
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax
set foldenable


""
" Invisible characters
"
set listchars=tab:⇥\ ,trail:·
set list  " Show invisible characters


""
" Scroll offsets
"
set scrolloff=5
set sidescrolloff=10


""
" Splitting windows
"
set splitbelow
set splitright


""
" Terminal color settings
"
" Setting color to 16 for xterm
if &term == "xterm" || &term == 'screen'
  set t_Co=16
  " clearing using the current background color
  set t_ut=
  colorscheme default
endif

if $COLORTERM == 'gnome-terminal'
  set term='xterm-256color'
endif

" Setting color to 256 for more sophisticated terminals
if &term =~ '256color'
  set t_Co=256
  " clearing using the current background color
  set t_ut=
endif

if !empty(glob('~/.local/share/nvim/plugged/base16-vim')) && filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif


""
" Wild menu
"
" wildmenu is set by sensible
set wildmode=longest,full
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif


""
" Wrapping
"
set colorcolumn=120
set textwidth=0
set wrapmargin=0
set wrap
set linebreak
set breakindent


""
" Miscellaneous
"
set cursorline                        " draws a line to show the current line
set noshowmode                        " don't show mode, status bar plugin will show it
set number                            " show line numbers
set ruler                             " show cursor position
set showcmd                           " show partial command
set visualbell                        " beep visually


"===============================================================================
" Plugins
"===============================================================================

" Neomake
"----------------------------------------
augroup nvimconf_neomake
  autocmd!
  autocmd! BufNewFile,BufRead,BufWritePost * Neomake
augroup END


" deoplete
"----------------------------------------
" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Use smartcase.
let g:deoplete#enable_smart_case = 1

let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.ruby = ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::']

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.ruby = [
  \ 'rubycomplete#Complete'
\]

call deoplete#custom#set('buffer', 'rank', 9999)
call deoplete#custom#set('ultisnips', 'rank', 9998)


" UltiSnips
"----------------------------------------
" Trigger configuration. Removed to mix it with deoplete.
let g:UltiSnipsExpandTrigger="<nop>"
let g:UltiSnipsJumpForwardTrigger="<nop>"
let g:UltiSnipsJumpBackwardTrigger="<nop>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" Airline
"----------------------------------------
let g:airline_powerline_fonts = 0
let g:airline_theme = 'base16'
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '▸'
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = '◂'
let g:airline_left_sep          = ''
let g:airline_left_alt_sep      = '>'
let g:airline_right_sep         = ''
let g:airline_right_alt_sep     = '<'
let g:airline_symbols.readonly  = '⊘'
let g:airline_symbols.linenr    = '␊'
let g:airline_symbols.branch    = '⎇' "⮑, ➔, ➥, ⤴
" let g:airline_symbols.paste     = 'ρ' "Þ, ∥
let g:airline_symbols.whitespace = 'Ξ'


" Indent Guides
"----------------------------------------
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 5
let g:indent_guides_auto_colors = 0

augroup multi_indent_guides
  autocmd!
  autocmd VimEnter,Colorscheme * :highlight IndentGuidesOdd  ctermbg=18
  autocmd VimEnter,Colorscheme * :highlight IndentGuidesEven ctermbg=19
augroup END


" NERDTree
"----------------------------------------
let NERDTreeShowHidden=1


" Easymotion
"----------------------------------------
let g:EasyMotion_smartcase = 1


"===============================================================================
" Languages
"===============================================================================

" Ruby
"----------------------------------------
augroup myvim_ruby
  autocmd!
  autocmd FileType ruby,eruby setlocal tabstop=2|set shiftwidth=2
  autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
augroup END


" Python
"----------------------------------------
" Auto completion is done by deoplete jedi

"===============================================================================
" Key mappings
"===============================================================================

let g:mapleader = "\<Space>"
let g:maplocalleader = "\\"


" Easymotion
"----------------------------------------
nmap <Leader>s <Plug>(easymotion-s2)
vmap <Leader>s <Plug>(easymotion-s2)


" Autocomplete and Snippets
"----------------------------------------
function! s:expand_snippet_or_key(key) abort
  let g:ulti_expand_or_jump_res = 0
  let snippet = UltiSnips#ExpandSnippetOrJump()
  return (g:ulti_expand_or_jump_res > 0) ? snippet : a:key
endfunction

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

inoremap <silent> <expr> <CR> pumvisible() ? "<C-y><C-R>=UltiSnips#ExpandSnippet()<CR>" : "\<CR>"

inoremap <silent> <expr> <TAB> pumvisible() ? "\<C-n>" : "<C-R>=<SID>expand_snippet_or_key(\"\t\")<CR>"
snoremap <silent> <TAB> <Esc>:call UltiSnips#ExpandSnippetOrJump()<CR>
inoremap <silent> <expr> <S-TAB> pumvisible() ? "\<C-p>" : "<C-R>=UltiSnips#JumpBackwards()<CR>"
snoremap <silent> <S-TAB> <Esc>:call UltiSnips#JumpBackwards()<CR>


" FZF
"----------------------------------------
nnoremap <silent> <Leader>fb :Buffers<CR>
nnoremap <silent> <Leader>fc :Commands<CR>
nnoremap <silent> <Leader>ff :Files<CR>
nnoremap <silent> <Leader>fh :History<CR>
nnoremap <silent> <Leader>fl :Lines<CR>
nnoremap <silent> <Leader>fm :Maps<CR>
nnoremap <silent> <Leader>fs :Ag<CR>
nnoremap <silent> <Leader>ft :Tags<CR>
nnoremap <silent> <Leader>fw :Ag <C-R><C-W><CR>


" NerdTree
"----------------------------------------
map <silent> <leader>n :NERDTreeToggle<CR>


" Fugitive
"----------------------------------------
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
nnoremap <silent> <leader>gl :Git log --stat --graph --decorate --all<CR>
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gh :Gsplit<CR>
nnoremap <silent> <leader>gv :Gvsplit<CR>


" vim:set filetype=vim expandtab shiftwidth=2:
