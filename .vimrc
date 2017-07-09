set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Go
Plugin 'fatih/vim-go', {'for': 'go'}
Plugin 'godoctor/godoctor.vim'
Plugin 'sebdah/vim-delve'

" JavaScript
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'

" Git
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Other
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'rizzatti/dash.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'janko-m/vim-test'
Plugin 'neomake/neomake'
Plugin 'tpope/vim-dispatch'

" Mono
Plugin 'OmniSharp/omnisharp-vim'

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'mzlogin/vim-markdown-toc'
Plugin 'dhruvasagar/vim-table-mode'

" Color scheme
Plugin 'joshdick/onedark.vim'
Plugin 'endel/vim-github-colorscheme'

" Autocomplete
Plugin 'Shougo/deoplete.nvim'
Plugin 'zchee/deoplete-go', { 'do': 'make'}

" Shougo
Plugin 'Shougo/denite.nvim'
Plugin 'Shougo/vimproc.vim', { 'do': 'make' }
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

" File type
Plugin 'elzr/vim-json', {'for' : 'json'}
Plugin 'cespare/vim-toml', {'for' : 'toml'}
Plugin 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
Plugin 'martinda/Jenkinsfile-vim-syntax', {'for' : 'Jenkinsfile'}

call vundle#end()

" Vim settings
let mapleader=" "               " Change leader to space
colorscheme onedark             " Turn on onedark theme 
let g:rehash256=1               " Bring the 256 color version as close as possible to the the default (dark) GUI version
filetype plugin indent on       " Automatically detect file types
syntax on                       " Enable syntax highlighting
set scrolloff=999               " Enable cursor to stay in the middle line when possible
set incsearch                   " Jump to matches while typing
set ignorecase                  " Ignore case while searching
set smartcase                   " Enable smart search (lower/upper case)
set relativenumber              " Enable relative numbers
set number                      " Line numbers
set noerrorbells                " No beeps
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set completeopt-=preview        " Don't pop up preview window
set backspace=indent,eol,start  " Makes backspace key more powerful
set ruler                       " Show position
set showcmd                     " Show command
set noshowmode                  " Do not show current mode, airline handles it
set title                       " Enable title
set clipboard=unnamed           " Enable shared clipboard
set autoread                    " Automatic file reload
set wildmode=longest,list,full  " Bash-like tab completion
set history=1000                " Store a ton of history (default is 20)
set mouse=a                     " Enable mouse
set colorcolumn=80              " Enable ColorColumn
set lazyredraw                  " Wait to redraw
set ttyfast                     " Performance boost
set pumheight=10                " Completion window max size
set autowrite                   " Automatically write content on :make command
set updatetime=100              " Update status line more often
set conceallevel=0

" Remember last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Fast saving
nnoremap <leader>w :w!<cr>
nnoremap <silent> <leader>q :q!<CR>

" ColorColumn custom color
highlight ColorColumn ctermbg=234

" Disable macroses
map q <Nop>

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

" Flexible window splits
set winwidth=85

" Scroll past end / beginning
set scrolloff=5

" Status line
set laststatus=2
set statusline=%t%m%r\ %{fugitive#statusline()}%=[%{&ff}%Y]\ [%04l,%04v,%p%%]

" Better split switching
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Source (reload configuration)
nnoremap <silent> <F5> :source $MYVIMRC<CR>

" Print full path
map <C-f> :echo expand("%:p")<cr>

" Terminals
if has('nvim')
  tnoremap <Leader>e <C-\><C-n> 
endif

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" neomake
autocmd! BufWritePost * Neomake
let g:neomake_open_list = 2
nmap <Leader>b :Neomake!<CR>

" vim-test
" let test#strategy = "neomake"
nmap <silent> <Leader>t :TestFile<CR>

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" Adjust tabs for .go files
autocmd BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

" Mono
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
au FileType cs OmniSharpHighlightTypes
autocmd BufWritePost *.cs call OmniSharp#AddToProject()

" vim-go
let g:go_term_enabled = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_addtags_transform = "snakecase"

let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1

let g:go_snippet_engine = "neosnippet"

let g:go_metalinter_deadline = "5s"
let g:go_metalinter_enabled = [
    \ 'vet',
    \ 'vetshadow',
    \ 'gotype',
    \ 'deadcode',
    \ 'gocyclo',
    \ 'golint',
    \ 'varcheck',
    \ 'structcheck',
    \ 'aligncheck',
    \ 'errcheck',
    \ 'megacheck',
    \ 'dupl',
    \ 'ineffassign',
    \ 'interfacer',
    \ 'unconvert',
    \ 'goconst',
    \ 'gas',
    \ 'goimports',
    \ 'misspell',
    \ 'unparam'
\]

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

au FileType go nmap <Leader>s <Plug>(go-def-split)
au FileType go nmap <Leader>v <Plug>(go-def-vertical)
au FileType go nmap <Leader>rr <Plug>(go-rename)
au FileType go nmap <Leader>l <Plug>(go-metalinter)
au FileType go nmap <Leader>ga :GoAlternate<cr>

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme="onedark"

" Tagbar
nmap <silent> <leader>tt :TagbarToggle<CR>
let g:tagbar_width = 40
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" dash.vim
nmap <silent> <leader>h :Dash<CR>

" fugitive.vim
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Gpush<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
nnoremap <silent> <leader>ga :Git add -p %<CR>
nnoremap <silent> <leader>gg :SignifyToggle<CR>
set diffopt+=vertical

" delimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let delimitMate_smart_quotes = 1
let delimitMate_expand_inside_quotes = 0
let delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

" vim-markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1

" deoplete.nvim
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['buffer', 'member', 'tag', 'file', 'neosnippet']
let g:deoplete#sources = {}
let g:deoplete#sources.cs = ['cs', 'omni', 'file', 'dictionary', 'buffer']
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#align_class = 1

" Use partial fuzzy matches like YouCompleteMe
call deoplete#custom#set('_', 'matchers', ['matcher_fuzzy'])
call deoplete#custom#set('_', 'converters', ['converter_remove_paren'])
call deoplete#custom#set('_', 'disabled_syntaxes', ['Comment', 'String'])

let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.cs = ['\w*']

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" denite.nvim
nnoremap <C-p> :Denite buffer file_rec<cr>
nnoremap <leader>/ :Denite grep:.<cr>

" Change mappings.
call denite#custom#map(
      \ 'insert',
      \ '<C-j>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-k>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)

" Change sorters.
call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])

" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" NERDTree
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>
let NERDTreeShowHidden=1

" Open if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:table_mode_corner="|"

let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
