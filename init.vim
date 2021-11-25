"
"██╗███╗░░██╗██╗████████╗░░░██╗░░░██╗██╗███╗░░░███╗
"█║████╗░██║██║╚══██╔══╝░░░██║░░░██║██║████╗░████║
"██║██╔██╗██║██║░░░██║░░░░░░╚██╗░██╔╝██║██╔████╔██║
"██║██║╚████║██║░░░██║░░░░░░░╚████╔╝░██║██║╚██╔╝██║
"██║██║░╚███║██║░░░██║░░░██╗░░╚██╔╝░░██║██║░╚═╝░██║
"╚═╝╚═╝░░╚══╝╚═╝░░░╚═╝░░░╚═╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝



"---------------------------------vim config----------------------------

"plegado
set foldmethod=indent 
set foldnestmax=10 
set nofoldenable 
set foldlevel=2

" autoindexar
set sw=2
set relativenumber

" pegar
set clipboard=unnamed

"para que aparezcan los numeros
set number
set ruler

"para poder hacer scroll con el mouse
set mouse=a

"consola
set showcmd

"busqueda
set showmatch
set hlsearch
set ignorecase
set list
set smartcase
set incsearch
set cursorline

set showmode
set title
set background=dark
set laststatus=2
set backspace=2
set guioptions-=T
set guioptions-=L
set encoding=utf-8
let mapleader= " "
imap ii <Esc>
"------------------------------Plugins-------------------------------
"Plugins
call plug#begin('~/.vim/plugged')
" Temas
" Themes
Plug 'sonph/onehalf', { 'rtp': 'vim' }

"Copilot
Plug 'https://github.com/github/copilot.vim.git'
"IDgithub/copilotE
Plug 'easymotion/vim-easymotion'
 "Nerdtree
Plug 'preservim/nerdtree'
"Navigate with C-h C-l C-j C-k
"Navegar con C-h C-l C-j C-k
Plug 'christoomey/vim-tmux-navigator'
"Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Stable version of coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}


"Close pairs () [] {} ''
"Cerrar los pares () [] {} '' 
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
"FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

"PRettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"css color
Plug 'ap/vim-css-color'

"emmet
Plug 'mattn/emmet-vim'

"ALE  linter

Plug 'dense-analysis/ale'


"eslint
Plug 'eslint/eslint'


call plug#end()

"--------------------------------Plugins Config--------------------------------------------


let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
 
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'


colorscheme onehalfdark

"save file
"guardar archivo
nmap <leader>w :w<CR>
"cerrar ventana
"close current  window
nmap <leader>q :q <CR>
nmap <leader>so :so%<CR>
"search commands 
"comandos de busqueda
nmap <leader>gs  :CocSearch
nmap <leader>fs :FZF<CR>
"nmap <leader>rg :Rg<CR>
"Limpiar busqueda
nmap <silent>cs :nohlsearch<CR>
"cog
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"rmap keys for gotos
nmap <silent gd <Plug>(coc-definition)
nmap <silent gy <Plug>(coc-type-definition)
nmap <silent gi <Plug>(coc-implementation)
nmap <silent gr <Plug>(coc-references)


"emmet
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
\  'variables': {'lang': 'es'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      '!': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."\t<title></title>\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}


"abrir Nerdtree
"open nerdtree
nmap <Leader>nt :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTeeDirArrows=1

let NERDTreeShowHidden=1

let NERDTeeShowLineNumbers=1
let NERDTreeMapOpenInTab='\t'
let g:javascript_plugin_flow=1
"Buscar dos carácteres con easymotion

"Search for two chars with easymotion
nmap <Leader>s <Plug>(easymotion-s2)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" TAB in general mode will move to text buffer
" TAB en modo normal se moverá al siguiente buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
" SHIFT-TAB va para atras 
nnoremap <silent> <S-TAB> :bprevious<CR>
"close buffer
"cerrar buffer
nmap <leader>bd :bdelete<CR>



"Close tags automatically
"Cerrar tags automaticamente
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.jsx, *.js'


"-----------------------------------------------------------------


" prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#config#print_width = 120
let g:prettier#config#semi="false"
let g:prettier#config#single_quote = 'true'
let g:prettier#config#tab_width = 4
let g:prettier#config#use_tabs = 'false'
" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0
let g:prettier#quickfix_auto_focus = 0
nmap <Leader>py <Plug>(Prettier)

"SQL COC
let g:LanguageClient_serverCommands = {
    \ 'sql': ['sql-language-server', 'up', '--method', 'stdio'],
    \ }
