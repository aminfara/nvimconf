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

call plug#begin('~/.local/share/nvim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'neomake/neomake'
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
let g:neomake_open_list = 5

augroup nvimconf_neomake
  autocmd!
  autocmd! BufNewFile,BufRead,BufWritePost * Neomake
augroup END

" vim:set filetype=vim expandtab shiftwidth=2:
