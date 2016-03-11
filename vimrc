" Pathogen plugin for easy adding of future plugins
" ---------
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" General Setup
" -----
"stop blinking cursor
set guicursor=a:blinkon0
"set line numbers
set number
"figure out file type
filetype plugin indent on
"automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc
"node dictionary
au FileType javascript set dictionary+=$HOME/.vim/bundle/node-vim/dict/node.dict
"resize splits when the window is resized
au VimResized * exe "normal! \<c-2>="


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

"Set color column width"
"if exists('+colorcolumn')
"	set colorcolumn=79
"else
"	au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)
"endif

" Colors
" ---------
"
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

" Status
" -----

"Always display the status line
set laststatus=2


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
"
"
"
" Copy/Paste
" ----
"nnoremap <C-y> "+y
"vnoremap <C-y> "+y
"nnoremap <C-p> "+gP
"vnoremap <C-p> "+gP



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

" CtrlP
" --------
" set the maximum window height to be larger
let g:ctrlp_max_height = 30

" When opening a file with <cr> or <c-t>, if the file's
" already opened somewhere " |CtrlP| will try to jump to
" it instead of opening a new instance: >
"  1 - only jump to the buffer if it’s opened in the current tab.
"  2 - jump tab as well if the buffer's opened in another tab.
"  0 - disable this feature.
let g:ctrlp_jump_to_buffer = 2

" ctrlp prompt mappings
let g:ctrlp_prompt_mappings = {
    \ 'PrtClearCache()':      ['<c-c>'],
    \ 'PrtExit()':            ['<esc>', '<c-g>'],
	\ }

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
"if executable('ag')
"  " Use Ag over Grep
"  set grepprg=ag\ --nogroup\ --nocolor
"
"  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"  let g:ctrlp_user_command = 'ag %s -l --nocolor -f -U -g ""'
"  "let g:ctrlp_user_command = 'ag %s --ignore="node_modules" -l --nocolor -f -U -g ""'
"  "let g:ctrlp_user_command = 'find %s -type f'
"endif
" --------

set wildignore+=*/tmp/*,*/.git/*,*/*.o,*/*.a,*/*.dep,*/*.swp	" Linux/MacOSX

autocmd VimResized * wincmd =

"open vimrc from anywhere
map <leader>vimrc :vsp ~/.vim/vimrc<cr>
" source vimrc when written
"autocmd bufwritepost vimrc source $MYVIMRC

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


" jsdoc
" --------
" Ctrl-g hotkey
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_additional_descriptions=1


" --------
" nerd-tree
" --------
map <C-t> :NERDTreeToggle<CR>


" ---------------------
" fugitive git bindings
" ---------------------
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>

" fugitive github domains
let g:fugitive_github_domains = ["ghe.ops.betable.com"]
