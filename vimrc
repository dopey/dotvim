" =============================================================================
" Pathogen
" =============================================================================
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" =============================================================================
" General Settings
" =============================================================================
set guicursor=a:blinkon0    "stop blinking cursor
set number                  "set line numbers
filetype plugin indent on   "figure out file type
au BufWritePost .vimrc so ~/.vimrc "automatically reload vimrc when it's saved
au FileType javascript set dictionary+=$HOME/.vim/bundle/node-vim/dict/node.dict    "node dictionary
"resize splits when the window is resized
au VimResized * exe 'normal! \<c-2>='

" Set OS variable
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif



" Indenting and tabbing
" -------
" Auto indent next row to same place as current
" set autoindent
" tab settings
set expandtab tabstop=4 softtabstop=4 shiftwidth=4
set smarttab
set cindent

au FileType javascript setlocal shiftwidth=4 softtabstop=4 tabstop=4

au FileType make setlocal noexpandtab

" =============================================================================
" Code Completion
" =============================================================================

" UltiSnips
" ---------
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Set python version
let g:UltiSnipsUsePythonVersion = 2


" =============================================================================
" Cosmetic
" =============================================================================

set cc=80   " set columncolor at column 80

syntax on
set background=dark
" let g:solarized_termcolors = 256
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
colorscheme solarized
set modeline

"Toggle solarized bg
call togglebg#map("<C-g>")

" Set paste toggle
nnoremap <F8> :set invpaste paste?<CR>
set pastetoggle=<F8>
set showmode

" Set number toggle
set number
nnoremap <F9> :set nonumber!<CR>

" lightline
" --------
let g:lightline = {
      \ 'active': {
      \     'left': [ [ 'mode', 'paste' ],
      \       [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \     },
      \ 'component': {
      \   'readonly': '%{&readonly?"x":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '|', 'right': '|' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }
" --------

set laststatus=2    "Always display the status line


" Search
" -----

" incremental search
set incsearch " incremental search

" Highlight the search terms
set hlsearch " highlight search results

" Ignore case when searching
set ic " ignore case in search
" ...but take it into account if uppercase letter in pattern
set smartcase

" Wrap search when EOF is reached
set wrapscan

" Backspace
" ----
set backspace=indent,eol,start

" Maps
" ---------
let mapleader = ","
" space clears screeen of all highlights
nnoremap <silent> <Space> :nohl<CR><C-l>
" don't jump over text-wrapped lines
map j gj
map k gk

" Map for easier escape access
inoremap ,w <Esc>:w<Enter>
nnoremap ,w :w<CR>

" Map for easier quit access
nnoremap ,q :q<CR>

"New line below or above in normal mode
nnoremap ,a O<Esc>j
nnoremap ,b o<Esc>k


"Delete line above
map ,da kdd
"Delete line below
map ,db jddk

"Select recently pasted area in visual block
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
"Start line with a comma in correct location
inoremap ,, <Backspace><Space><Space>,<Space>
"In normal mode, you can press prefix keys before a command (for example, 12
"for a count). The nnoremap causes Tab to cancel any prefix keys.
"The vnoremap causes Tab to cancel any selection (gV is required to prevent
"automatic reselection).
"
"The onoremap causes Tab to cancel any operator-pending command (for example,
"y).
"
"The first inoremap causes Tab to exit insert mode, and the `^ restores the
"cursor position so exiting insert does not move the cursor left.
"
"The second inoremap, assuming the default leader key, allows you to press \
"then Tab to insert a tab character.
nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
"inoremap <Tab> <Esc>`^
inoremap <Leader><Tab> <Tab>
"
"Keep search pattern at the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

"Easier split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Map semicolon to colon
map ; :
noremap ;; ;

"Make operation from within vim/ open vertical window
"nnoremap <C-c> :!cscope -Rbq<CR> :cs add cscope.out<CR>
" automatically strip trailing whitespace when a file is saved
  :autocmd BufWritePre * :%s/\s\+$//e

" Cscope
" --------
set nocscopeverbose

" JS Mocha macro -- test only
let @o= "ea.only:w\n"

set wildignore+=*/tmp/*,*/.git/*,*/*.o,*/*.a,*/*.dep,*/*.swp	" Linux/MacOSX

autocmd VimResized * wincmd =

"open vimrc from anywhere
map <leader>vimrc :vsp ~/.vim/vimrc<cr>
" source vimrc when written
"autocmd bufwritepost vimrc source $MYVIMRC



" jsdoc
" --------
" Ctrl-g hotkey
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_additional_descriptions=1


" =============================================================================
" Revision Control
" =============================================================================
"
" fugitive
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gg :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gbr :Gbrowse
nnoremap <space>gp :Gpush<CR>
nnoremap <space>gpl :Gpull<CR>

" Necessary to define Browse so vim can open browser windows
command! -bar -nargs=1 Browse silent! !open <args>


" =============================================================================
" File Navigation
" =============================================================================

" nerd-tree
map <C-t> :NERDTreeToggle<CR>

" FZF
if g:os == "Darwin"
    set rtp+=/usr/local/opt/fzf
elseif g:os == "Linux"
    set rtp+=~/.fzf         "linux
else
    set rtp+=~/.fzf         "linux
endif

nnoremap <silent> <leader><space> :Files<CR>

" Setting ag as the default source for fzf
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

if g:os == "Darwin"
    set rtp+=/usr/local/opt/fzf
elseif g:os == "Linux"
    set rtp+=~/.fzf         "linux
else
    set rtp+=~/.fzf         "linux
endif


" =============================================================================
" Markdown-Preview
" =============================================================================

" Map control to M
let vim_markdown_preview_hotkey='<C-m>'

" Set default browser to Chrome (default on OSX is safari)
let vim_markdown_preview_browser='Google Chrome'

" github flavored markdown (requires python grip)
let vim_markdown_preview_github=1


" =============================================================================
" Syntastic
" =============================================================================

" redefine syntastic go checkers, otherwise syntastic recompiles entire
" project on save
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']


" =============================================================================
" Golang
" =============================================================================

" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"
