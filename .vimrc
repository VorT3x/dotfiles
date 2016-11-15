set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Go
Plugin 'fatih/vim-go', {'for': 'go'}

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
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'JamshedVesuna/vim-markdown-preview'

" Color scheme
Plugin 'joshdick/onedark.vim'
Plugin 'endel/vim-github-colorscheme'

" Autocomplete
Plugin 'Shougo/deoplete.nvim'
Plugin 'zchee/deoplete-go', { 'do': 'make'}
Plugin 'ervandew/supertab'

" Shougo
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim', { 'do': 'make' }

" File type
Plugin 'elzr/vim-json', {'for' : 'json'}
Plugin 'cespare/vim-toml', {'for' : 'toml'}
Plugin 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}

call vundle#end()

" Vim settings
set langmenu=en_US
let $LANG = 'en_US'
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

" 2 spaces to a tab, spaces as tab
set expandtab
set shiftwidth=2
set softtabstop=2
set smartindent

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

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" Adjust tabs for .go files
autocmd BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

" vim-go
let g:go_term_enabled = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1

au FileType go nmap <Leader>ca <Plug>(go-callers)
au FileType go nmap <Leader>c <Plug>(go-callees)
au FileType go nmap <Leader>co <Plug>(go-coverage)

au FileType go nmap <Leader>r :GoRun<CR>
au FileType go nmap <Leader>s <Plug>(go-def-split)
au FileType go nmap <Leader>v <Plug>(go-def-vertical)
au FileType go nmap <Leader>in <Plug>(go-info)
au FileType go nmap <Leader>ii <Plug>(go-implements)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>d <Plug>(go-doc)
au FileType go nmap <Leader>rr <Plug>(go-rename)
au FileType go nmap <Leader>l <Plug>(go-metalinter)

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

" vim-markdown-preview
let vim_markdown_preview_toggle=2
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-l>'
let vim_markdown_preview_browser='Safari'

" vim-markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" deoplete.nvim
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['buffer', 'member', 'tag', 'file', 'neosnippet']
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#align_class = 1

" Use partial fuzzy matches like YouCompleteMe
call deoplete#custom#set('_', 'matchers', ['matcher_fuzzy'])
call deoplete#custom#set('_', 'converters', ['converter_remove_paren'])
call deoplete#custom#set('_', 'disabled_syntaxes', ['Comment', 'String'])

" unite.vim
nnoremap <C-p> :Unite buffer file_rec/neovim -start-insert<cr>
nnoremap <leader>/ :Unite grep:.<cr>

" Nerd TREE
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>
let NERDTreeShowHidden=1

" ultisnips
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"
