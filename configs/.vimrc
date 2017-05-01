
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Plugin Managers                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""








"""""""""""
"  Vundle "
"""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Here is the place for new plugins!
" 1: nerdtree
" 2: nerdtree tabs
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'tpope/vim-fugitive'

"
" Information on how to add plugins:
"
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Plugin 'git://git.wincent.com/command-t.git'
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

call vundle#end()            " required
filetype plugin indent on    " required


" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just 
"                     :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to 
"                     auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line










"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Utility functions:                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" original setting: <Leader> = \.
let mapleader=","

" <CMD>+ww is used for switching from nerdtree the text window.
" let's change that.
"map <leader>ww <Ctrl>ww
map <Leader>n <plug>NERDTreeTabsToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


set tw=79
set nowrap "don't automatically wrap on load
set fo-=t  "don't automatically wrap text when typing.

" separate lines into entire paragraph such that the lenght of the lines
" is leq 80 characters.
vmap Q gq
nmap Q gqap

" Useful settings
set history=700
set undolevels=700

" interesting stuff:
" for automatically reloading changes in vimrc
autocmd! bufwritepost .vimrc source %


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" boring std clipboard
" set clipboard=unnamed

" standard behavior of backspace key (whatever that means)
" set bs=2

" Make search case insensitive
"" set hlsearch
"" set incsearch
"" set ignorecase
"" set smartcase

" Disable backup and swap files in case they trigger too many events
" for file system watchers
"" set nobackup
"" set nowritebackup
"" set noswapfile






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""     Movement:  windows, tabs, files   """""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows: 	move between windows
"		by pressing <Ctrl>+hjkl
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" Tabs:		move between tabs 
"		by pressing <Ctrl>+nm
map <c-n> <esc>:tabprevious<CR>
map <c-m> <esc>:tabnext<CR>

" TODO: open tab :newtab
" TODO: Close tab
" TOOD: find in files more easily




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Coding Conventions                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Real programmers don't use TABs but spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        Programs and Languages                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""
"    LATEX Latex latex   "
""""""""""""""""""""""""""

" makes vim invoke latex suite when opening tex file
filetype plugin on

" set shellslash " i think this is not required so i dont use it

" grep sometimes skips displaying the filename if searching in a
" single file. This will confuse Latexsuite. Set up grep program
" to always generate a filename
set grepprg=grep\ -nH\ $*

" auto indent
filetype indent on

" load vimlatex even in empty .tex file
let g:tex_flavor='latex'

" This causes the instnat markdown not to be 
" that instant for saving battery power.
let g:instant_markdown_slow = 1


""""""""""""""""""""""""""
"  PYTHON python Python  "
""""""""""""""""""""""""""

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
"" set laststatus=2


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
"" let g:ctrlp_max_height = 30
"" set wildignore+=*.pyc
"" set wildignore+=*_build/*
"" set wildignore+=*/coverage/*


" Settings for python-mode
" Note: I'm no longer using this. Leave this commented out
" and uncomment the part about jedi-vim instead
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
"" map <Leader>g :call RopeGotoDefinition()<CR>
"" let ropevim_enable_shortcuts = 1
"" let g:pymode_rope_goto_def_newwin = "vnew"
"" let g:pymode_rope_extended_complete = 1
"" let g:pymode_breakpoint = 0
"" let g:pymode_syntax = 1
"" let g:pymode_syntax_builtin_objs = 0
"" let g:pymode_syntax_builtin_funcs = 0
"" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
"" let g:jedi#usages_command = "<leader>z"
"" let g:jedi#popup_on_dot = 0
"" let g:jedi#popup_select_first = 0
"" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
"" set completeopt=longest,menuone
"" function! OmniPopup(action)
""     if pumvisible()
""         if a:action == 'j'
""             return "\<C-N>"
""         elseif a:action == 'k'
""             return "\<C-P>"
""         endif
""     endif
""     return a:action
"" endfunction

"" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
"" set nofoldenabl





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Appearance                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show whitespace (MUST be inserted BEFORE the colorscheme command)
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"au InsertLeave * match ExtraWhitespace /\s\+$/
" The following alternative may be less obtrusive.
:highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
" Try the following if your GUI uses a dark background.
":highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen  
" Show trailing whitespace:
:match ExtraWhitespace /\s\+$/

" Show trailing whitespace and spaces before a tab:
:match ExtraWhitespace /\s\+$\| \+\ze\t/

" Show tabs that are not at the start of a line:
:match ExtraWhitespace /[^\t]\zs\t\+/

" Show spaces used for indenting (so you use only tabs for indenting).
:match ExtraWhitespace /^\t*\zs \+/
" Switch off :match highlighting.
":match

" display tabs
set list
set listchars=tab:>-



" This colorscheme has been adapted by me for adapting the blue lines for
" the display of my x230. 
colorscheme corporation_modified
highlight LineNr ctermfg=12
highlight ColorColumn ctermbg=2 

"
" enable relative numbering
set relativenumber
set number

" 
" max line width
set colorcolumn=80
match ErrorMsg '\%>80v.\+'


"
" Startup function:
"   (1) start NERDTre
"   (1) start NERDTreee
function! StartUp()
  "NERDTree
  NERDTreeTabsToggle
endfunction

autocmd VimEnter * call StartUp() 




inoremap <Leader>s :sort<CR>

"
" syntax highlighting
syntax on




