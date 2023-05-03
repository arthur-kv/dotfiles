" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'preservim/nerdtree' 
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug '907th/vim-auto-save'

Plug 'mattn/emmet-vim'

" https://github.com/moby/moby/tree/master/contrib/syntax/vim
" Syntax highlighting for Dockerfiles
" Plug 'moby/moby' , {'rtp': '/contrib/syntax/vim/'}

" === JS === "

Plug 'prettier/vim-prettier', {
  \ 'do': 'npm i',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html', 'typescriptreact'] }
Plug 'w0rp/ale'
" JavaScript bundle for vim, this bundle provides syntax highlighting and improved indentation
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" The React syntax highlighting and indenting plugin for vim. Also supports the typescript tsx file.
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'

" === === === "

" A collection of language packs for Vim
" Plug 'sheerun/vim-polyglot'

" Instant Markdown previews from VIm
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

" === Ruby === "
Plug 'vim-ruby/vim-ruby' " https://vimawesome.com/plugin/vim-ruby
Plug 'tpope/vim-rails'
" === === ===


" === THEMES === "
Plug 'sainnhe/sonokai'
Plug 'nanotech/jellybeans.vim'

" fzf is a general-purpose command-line fuzzy finder.
" It's an interactive Unix filter for command-line that can be used with any list; files, command history, processes, hostnames, bookmarks, git commits, etc.
" Requires: brew install the_silver_searcher
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'

Plug 'posva/vim-vue'

Plug 'tpope/vim-fugitive'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'lifepillar/pgsql.vim'

" Syntax highlighting for CJSON
Plug 'neoclide/jsonc.vim'

" A Vim plugin that toggles between hex and rgba color codes for css/sass/less editing
Plug 'jakerobers/vim-hexrgba'

" Highlights CSS in javascript template strings
Plug 'styled-components/vim-styled-components'
call plug#end()

set statusline+=%{FugitiveStatusline()}

" Auto save
let g:auto_save=0
" EMMET
let g:user_emmet_leader_key=','

syntax on " enable syntax processing
" https://vim.fandom.com/wiki/Fix_syntax_highlighting
set redrawtime=10000
set re=0
autocmd BufEnter * :syntax sync fromstart " For the most accurate but slowest result
" https://github.com/sainnhe/gruvbox-material/issues/5#issuecomment-729586348
" When the following option is set, the screen will not be redrawn while executing macros, 
" registers and other commands that have not been typed. 
" Also, updating the window title is postponed. 
set lazyredraw 
if has('termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif
if has('gui_running')
    set background=light
else
    set background=dark
endif
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
let g:jellybeans_use_term_italics = 1
colorscheme jellybeans
set number " show line numbers
set relativenumber
set ruler
" Folding:
" set foldmethod=indent " folds are defined by syntax highlighting
" set foldcolumn=1 " When non-zero, a column with the specified width is shown at the side of the window which indicates open and closed folds.  The maximum value is 12.
" let javaScript_fold=1
" set foldlevelstart=99 " Always start editing with all folds closed
set expandtab
set shiftwidth=2
set autoindent
set smartindent
set cursorline " Highlight cursor line
set scroll=5
set scrolloff=5 " show lines above and below cursor (when possible)
set clipboard=unnamed
" Fix color scheme issues in TMUX:
" https://github.com/tmux/tmux/issues/699#issuecomment-269572025
set background=dark
set t_Co=256
set cursorcolumn 
set showmatch " highlight matching [{()}]
set matchtime=0 " Remove jumping to a matching [{()}] when showmatch is enabled https://stackoverflow.com/a/36803748
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
"change colors of matching [{()}] highlight https://stackoverflow.com/a/10746829
set noerrorbells visualbell t_vb= "Disable annoying error noises
" https://stackoverflow.com/questions/15277241/changing-vim-gutter-color
highlight clear SignColumn

" ALE
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_sign_column_always = 1
" let g:ale_set_highlights = 0 " Turn off problems highlights - https://github.com/dense-analysis/ale#faq-change-highlights
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = { 'javascript': ['eslint'], 'css': ['stylelint'], 'scss': ['stylelint'], 'vue': ['eslint', 'vls'] }
let g:ale_linters_ignore = { 'html': [], 'typescript': ['deno'], 'typescriptreact': ['deno'] }
let g:ale_completion_enabled = 0
let g:ale_floating_preview = 1
" Use ALE's function for omnicompletion.
set omnifunc=ale#completion#OmniFunc

highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
" highlight ALEWarning ctermbg=NONE

" vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1


" NERDTree
let NERDTreeShowHidden = 1
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" VIM Vue
let g:vue_pre_processors = 'detect_on_enter'

" Golang
" Use new vim 8.2 popup windows for Go Doc
let g:go_doc_popup_window = 1

let g:go_list_height = 10
let g:go_list_type = "locationlist"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" PostgreSQL
let g:sql_type_default = 'pgsql'

" https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text
" Remap the p command in visual mode so that it first deletes to the black hole 
" register. This is needed if we want to paste the same text a second time.
xnoremap <leader>p "_dP
nmap <Leader>pr <Plug>(Prettier)

nnoremap <leader>h :ALEHover<CR>
nnoremap <leader>gd :ALEGoToDefinition<CR>
nnoremap <leader>gi :ALEGoToImplementation<CR>
nnoremap <leader>ad :ALEDetail<CR>
nnoremap <leader>fr :ALEFindReferences -relative<CR>
nnoremap <leader>ne :ALENextWrap<CR>
nnoremap <leader>pe :ALEPreviousWrap<CR>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <leader>F :NERDTreeFind<CR>

nnoremap <silent> <C-S> :FZF<CR>
" This requires https://github.com/ggreer/the_silver_searcher
nnoremap <silent> <S-S> :Ag<CR>
" toggle between hex color codes and rgba for editing css/sass/less
nnoremap <leader><C-h> :HexRgba<CR>


" === SNIPPETS === "

augroup snippets_go
  autocmd FileType go nnoremap ,gf ofunc () {<CR>}<ESC>kf(i
  autocmd FileType go nnoremap ,gfm ofunc () Method() {<CR>}<ESC>kf(a
  autocmd FileType go nnoremap ,gtf ofunc (t *testing.T) {<CR>}<ESC>kf(i

  autocmd FileType go nnoremap ,gtr ot.Run("", func (t *testing.T) {<CR>})<ESC>kf"a

  autocmd FileType go nnoremap ,gif oif  {<CR>}<ESC>kf<SPACE>a
augroup END

augroup snippets_js
  let g:sonokai_enable_italic = 1
  colorscheme sonokai 

  autocmd!
    
  " React:
  "<ESC>F{a<CR><CR><ESC>ki<TAB><TAB>
  autocmd FileType javascript,typescript,html,jsx nnoremap ,rcn i className=
  autocmd FileType javascript,typescript,html,jsx nnoremap ,ronc i onClick={() => }<ESC>i
  autocmd FileType javascript,typescript,html,jsx nnoremap ,rue ouseEffect(() => {});<ESC>F{a<CR><CR><ESC>ki<TAB><TAB>
  autocmd FileType javascript,typescript,html,jsx nnoremap ,rus oconst [] = useState();<ESC>F[a
  autocmd FileType javascript,typescript,html,jsx nnoremap ,rur oconst  = useRef();<ESC>Ftla
  autocmd FileType javascript,typescript,html,jsx nnoremap ,r< o<><CR></><ESC>ko
  "TODO nnoremap ,comp 
  
  " === TESTS ===
  autocmd FileType javascript,typescript,html,jsx nnoremap ,xtd f.dt(f)i, () => {}<ESC>i<CR><CR><ESC>ki<TAB>
  autocmd FileType javascript,typescript,html,jsx  nnoremap ,xtda f.dt(f)i, async () => {}<ESC>i<CR><CR><ESC>ki<TAB>
  
  " JS:
  autocmd FileType javascript,typescript,html,jsx nnoremap ,ji iimport {  } from "";<CR><ESC>kf{la
  autocmd FileType javascript,typescript,html,jsx nnoremap ,jid iimport  from "";<CR><ESC>kftla
  autocmd FileType javascript,typescript,html,jsx nnoremap ,jir iimport React from "react";<CR><ESC>kftla
  autocmd FileType javascript,typescript,html,jsx nnoremap ,jmap a.map(() => )<ESC>i
  autocmd FileType javascript,typescript,html,jsx nnoremap ,jfil a.filter(() => )<ESC>i

  autocmd FileType javascript,typescript,html,jsx nnoremap ,jr oreturn ;<ESC>i

  autocmd FileType javascript,typescript,html,jsx nnoremap ,j= a() => <ESC>a
  autocmd FileType javascript,typescript,html,jsx nnoremap ,ja= aasync () => <ESC>a
  autocmd FileType javascript,typescript,html,jsx nnoremap ,j=b a() => {}<ESC>F{a<CR><CR><ESC>ki<TAB><TAB>
  autocmd FileType javascript,typescript,html,jsx nnoremap ,ja=b aasync () => {}<ESC>F{a<CR><CR><ESC>ki<TAB><TAB>
  autocmd FileType javascript,typescript,html,jsx nnoremap ,jf afunction () {<CR>}<ESC>kela
  autocmd FileType javascript,typescript,html,jsx nnoremap ,jfa afunction () {<CR>}<ESC>ko
  autocmd FileType javascript,typescript,html,jsx nnoremap ,js a`${}`<ESC>hi
  autocmd FileType javascript,typescript,html,jsx nnoremap ,jcl oconsole.log();<ESC>hi
  autocmd FileType javascript,typescript,html,jsx nnoremap ,jd odebugger;<ESC>
  autocmd FileType javascript,typescript,html,jsx nnoremap ,td o// TODO: <ESC>
augroup END

" Markdown
nnoremap ,mdjs i```javascript<CR><CR>```<ESC>ki
nnoremap ,mdr i```ruby<CR><CR>```<ESC>ki
nnoremap ,mdb i```bash<CR><CR>```<ESC>ki

" Misc
nnoremap ,pst :r !pbpaste<CR>
