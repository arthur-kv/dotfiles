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
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
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
let g:sonokai_enable_italic = 1
colorscheme sonokai 
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
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
"change colors of matching [{()}] highlight https://stackoverflow.com/a/10746829
set noerrorbells visualbell t_vb= "Disable annoying error noises
" https://stackoverflow.com/questions/15277241/changing-vim-gutter-color
highlight clear SignColumn

" ALE
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = { 'javascript': ['eslint'], 'css': ['stylelint'], 'scss': ['stylelint'], 'vue': ['eslint', 'vls'] }
let g:ale_linters_ignore = { 'html': [], 'typescript': ['deno'] }
let g:ale_completion_enabled = 0
let g:ale_floating_preview = 1
" Use ALE's function for omnicompletion.
set omnifunc=ale#completion#OmniFunc

highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
highlight ALEWarning ctermbg=NONE

" vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1


" NERDTree
let NERDTreeShowHidden = 1
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" VIM Vue
let g:vue_pre_processors = 'detect_on_enter'

nnoremap <leader>h :ALEHover<CR>
nnoremap <leader>gd :ALEGoToDefinition<CR>
nnoremap <leader>gi :ALEGoToImplementation<CR>
nnoremap <leader>ad :ALEDetail<CR>
nnoremap <leader>fr :ALEFindReferences<CR>
nnoremap <leader>ne :ALENextWrap<CR>
nnoremap <leader>pe :ALEPreviousWrap<CR>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <leader>F :NERDTreeFind<CR>

nnoremap <silent> <C-S> :FZF<CR>
" This requires https://github.com/ggreer/the_silver_searcher
nnoremap <silent> <S-S> :Ag<CR>


" === SNIPPETS === "
"<ESC>F{a<CR><CR><ESC>ki<TAB><TAB>
" React:
nnoremap ,rcn i className=
nnoremap ,ronc i onClick={() => }<ESC>i
nnoremap ,rue ouseEffect(() => {});<ESC>F{a<CR><CR><ESC>ki<TAB><TAB>
nnoremap ,rus oconst [] = useState();<ESC>F[a
nnoremap ,rur oconst  = useRef();<ESC>Ftla
nnoremap ,r< o<><CR></><ESC>ko
"TODO nnoremap ,comp 


" === TESTS ===
nnoremap ,xtd f.dt(f)i, () => {}<ESC>i<CR><CR><ESC>ki<TAB>
nnoremap ,xtda f.dt(f)i, async () => {}<ESC>i<CR><CR><ESC>ki<TAB>

" JS:
nnoremap ,ji iimport {  } from "";<CR><ESC>kf{la
nnoremap ,jid iimport  from "";<CR><ESC>kftla
nnoremap ,jir iimport React from "react";<CR><ESC>kftla
nnoremap ,jmap a.map(() => )<ESC>i
nnoremap ,jfil a.filter(() => )<ESC>i

nnoremap ,jr oreturn ;<ESC>i

nnoremap ,j= a() => <ESC>a
nnoremap ,ja= aasync () => <ESC>a
nnoremap ,j=b a() => {}<ESC>F{a<CR><CR><ESC>ki<TAB><TAB>
nnoremap ,ja=b aasync () => {}<ESC>F{a<CR><CR><ESC>ki<TAB><TAB>
nnoremap ,jf afunction () {<CR>}<ESC>kela
nnoremap ,jfa afunction () {<CR>}<ESC>ko
nnoremap ,js a`${}`<ESC>hi
nnoremap ,jcl oconsole.log();<ESC>hi
nnoremap ,jd odebugger;<ESC>
nnoremap ,td o// TODO: <ESC>

" Markdown
nnoremap ,mdjs i```javascript<CR><CR>```<ESC>ki
nnoremap ,mdr i```ruby<CR><CR>```<ESC>ki
nnoremap ,mdb i```bash<CR><CR>```<ESC>ki

" Misc
nnoremap ,pst :r !pbpaste<CR>
