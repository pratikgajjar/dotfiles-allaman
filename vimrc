" Plugin Management {{{
call plug#begin()
" Nerdtree
Plug 'preservim/nerdtree'
" Nerdtree git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Colorscheme
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
" Whitespace
Plug 'ntpeters/vim-better-whitespace'
" Expand region
Plug 'terryma/vim-expand-region'
" 100+ lazy loading syntax
"Plug 'sheerun/vim-polyglot'
" fzf integration
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Fast movement in vim
" Color preview
Plug 'ap/vim-css-color'
Plug 'easymotion/vim-easymotion'
" Aligment
" Plug 'junegunn/vim-easy-align'
" Outliner for structured text
" Plug 'vim-voom/VOoM'
" Kubernetes itegration
" Plug 'andrewstuart/vim-kubernetes'
" Visualize undo tree
Plug 'mbbill/undotree'
" Vim prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['json', 'markdown', 'yaml', 'html'] }
" Statusline
Plug 'itchyny/lightline.vim'
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Surround
 Plug 'tpope/vim-surround'
" Tags
" Plug 'majutsushi/tagbar'
" Markdown addon
"Plug 'plasticboy/vim-markdown'
" Plug 'nelstrom/vim-markdown-folding'
" For formating md tables
" Plug 'godlygeek/tabular'
" Plug 'dhruvasagar/vim-table-mode'
" Ansible
Plug 'pearofducks/ansible-vim'
" Docker
Plug 'ekalinin/Dockerfile.vim'
" Go support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" wrapper of Terminal and REPL
" Plug 'kassio/neoterm'
" Commenting
Plug 'scrooloose/nerdcommenter'
" Distraction free writing
Plug 'junegunn/goyo.vim'
" Dimm and highlight cursor line
Plug 'junegunn/limelight.vim'
" Latex
" Plug 'vim-latex/vim-latex'
" Better % matching
Plug 'andymass/vim-matchup'
" Key mapping menu
" Plug 'liuchengxu/vim-which-key'
" Rainbow Paranthesis
" Plug 'luochen1990/rainbow'
" Find and Replace
" Plug 'brooth/far.vim'
" Terraform
Plug 'hashivim/vim-terraform'
" bufkill
Plug 'qpkorr/vim-bufkill'
call plug#end()
" }}}
" Colors {{{
silent! colorscheme dracula
" to work better with dracula
"let g:polyglot_disabled = ['yaml']
syntax enable
" Follow transperancy from temrinal
hi Normal guibg=NONE ctermbg=NONE
if (has("termguicolors"))
 set termguicolors
endif
" }}}
" UI {{{
set number relativenumber " relative and absolute line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
" Space above/beside cursor from screen edges
set scrolloff=3
set sidescrolloff=5
set wildmenu wildmode=full
set wildignorecase
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,**/node_modules/**,**.git/**,**/target/**     " MacOSX/Linux
set encoding=utf-8
set showmatch           " highlight matching [{()}]
" }}}
" Misc {{{
if has("win32")
  set clipboard=unnamed " default register is system clipboard
else
  set clipboard=unnamedplus " default register is system clipboard
endif
set hidden
set history=100
set nocompatible
"set autochdir " set pwd always to current file
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir
set backupdir=$HOME/.vim/swp/
set directory=$HOME/.vim/swp/
set timeoutlen=1000
set ttimeoutlen=10
" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" }}}
" Search {{{
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " ignore case in search patterns
" highlight last inserted text
nnoremap gV `[v`]
" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif
" }}}
" Default Mappings {{{
let mapleader=" "
" replace currently selected text with default register without yanking it
vnoremap p "_dP
" write file with sudo
cnoreabbrev w!! w !sudo tee > /dev/null %|
" move vertically by visual line when used withput count
" and move by physical line when used with count
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" Disable arrow keys completely in Insert Mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
" Visually move lines
vmap J :m +1<CR>gv
vmap K :m -2<CR>gv
" open previously opened file
nnoremap <Leader><tab> :e#<CR>
" duplicate file
nnoremap <silent> <Leader>fd :clear<bar>silent exec "!cp '%:p' '%:p:h/%:t:r-copy.%:e'"<bar>redraw<bar>echo "Copied " . expand('%:t') . ' to ' . expand('%:t:r') . '-copy.' . expand('%:e')<cr>
" Change behaviour of Y similar to C and D
nnoremap Y y$
" Keep selection active after indenting
vmap > >gv
vmap < <gv
" Cancel search with escape
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
" Toogle whitespace
nnoremap <Leader>tw :set list!<CR>
" Buffer handling
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bd :BD<CR>
nnoremap <Leader>bk :BD!<CR>
nnoremap <leader>bs :w<CR>
" Undotree
nmap <leader>u :UndotreeShow<CR>
nmap <leader>u :UndotreeShow<CR>
" }}}
" Folding {{{
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=2      " 10 nested fold max
" }}}
" Indenting {{{
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
" }}}
" Whitespace {{{
" Better Whitespace
" highlighting for the current line in normal mode can be disabled
let g:current_line_whitespace_disabled_soft=1
" strip all trailing whitespace everytime you save
let g:strip_whitespace_on_save = 1
" Do not ask for comfirmation
let g:strip_whitespace_confirm=0
" Strip whitelines at end of file
let g:strip_whitelines_at_eof=1
" characters for whitespaces
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
" }}}
" Windows handling {{{
" only show focused window
nnoremap <leader>on :on<CR>
" Terminal mode:
tnoremap <C-h> <c-\><c-n><c-w>h
tnoremap <C-j> <c-\><c-n><c-w>j
tnoremap <C-k> <c-\><c-n><c-w>k
tnoremap <C-l> <c-\><c-n><c-w>l
" Insert mode:
inoremap <c-h> <esc><c-w>h
imap <c-j> <esc><c-w>j
inoremap <c-k> <esc><c-w>k
inoremap <c-l> <esc><c-w>l
" Visual mode:
vnoremap <C-h> <Esc><c-w>h
vmap <C-j> <Esc><c-w>j
vnoremap <C-k> <Esc><c-w>k
vnoremap <C-l> <Esc><c-w>l
" Normal mode:
nnoremap <C-h> <c-w>h
nmap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-l> <c-w>l
" Resizing
nnoremap <Left> :vertical resize +1<CR>
nnoremap <Right> :vertical resize -1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>
" }}}
" Lightline {{{
set laststatus=2
set noshowmode " do not show mode because it is shown in the status line
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'spell' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'LightlineFilename'
      \ }
      \ }
function! LightlineFilename()
  return expand('%:p')
endfunction" }}}
" Nerdtree {{{
" Toggle NERDTree
nnoremap <Leader>pt :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>pv :NERDTreeFind<CR>
" quit vim if Nerdtree is the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open NERDTree automatically
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree
" Jump to the main window after Nerdtree is open
autocmd VimEnter * wincmd p
" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
"function! SyncTree()
"  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"    NERDTreeFind
"    wincmd p
"  endif
"endfunction
" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call SyncTree()

" Automatically delete the buffer of the deleted file
let NERDTreeAutoDeleteBuffer = 1
" Remove help message
let NERDTreeMinimalUI = 1

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
" }}}
" Goyo and limelight {{{
" Goyo and limelight integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" Limelight Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
" Limelight Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
" }}}
" Snippets {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom-snippets"]
" }}}
" Gitgutter {{{
let g:gitgutter_map_keys = 0
nmap <Leader>hn <Plug>(GitGutterNextHunk)
nmap <Leader>hp <Plug>(GitGutterPrevHunk)
nmap <Leader>hs <Plug>(GitGutterStageHunk)
nmap <Leader>hu <Plug>(GitGutterUndoHunk)
nmap <Leader>hv <Plug>(GitGutterPreviewHunk)
" }}}
" FZF {{{
nnoremap <C-p> :Files<CR>
nnoremap <leader>rg :Rg<CR>
nnoremap <leader>fr :History<CR>
"nnoremap <leader>w :Windows<CR>
nnoremap <leader>; :BLines<CR>
nnoremap <leader>: :BTags<CR>
nnoremap <leader>c :Commits<CR>
nnoremap <leader>ft :Filetypes<CR>
nnoremap <leader>s :Snippets<CR>
" }}}
" EasyMotion {{{
" Disable default mappings
let g:EasyMotion_do_mapping = 0
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>W <Plug>(easymotion-bd-w)
nmap <Leader>W <Plug>(easymotion-overwin-w)
" emulate vim-sneak
nmap <leader>S <Plug>(easymotion-s2)
" }}}
" Indenting {{{
" }}}
" Indenting {{{
" }}}
" Indenting {{{
" }}}
" Indenting {{{
" }}}
" Indenting {{{
" }}}
" vim:foldmethod=marker:foldlevel=0
