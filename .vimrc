" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'preservim/nerdtree' " https://github.com/preservim/nerdtree
" https://vimawesome.com/plugin/vim-auto-save
Plug '907th/vim-auto-save'

Plug 'mattn/emmet-vim'

" https://github.com/moby/moby/tree/master/contrib/syntax/vim
" Syntax highlighting for Dockerfiles
" Plug 'moby/moby' , {'rtp': '/contrib/syntax/vim/'}

" === JS === "

" https://github.com/prettier/vim-prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm i',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" https://github.com/dense-analysis/ale
Plug 'w0rp/ale'

" https://github.com/pangloss/vim-javascript
" JavaScript bundle for vim, this bundle provides syntax highlighting and improved indentation
Plug 'pangloss/vim-javascript'

" https://github.com/leafgarland/typescript-vim/wiki/Installation
Plug 'leafgarland/typescript-vim'

" https://github.com/MaxMEllon/vim-jsx-pretty
" The React syntax highlighting and indenting plugin for vim. Also supports the typescript tsx file.
Plug 'maxmellon/vim-jsx-pretty'

" https://github.com/jparise/vim-graphql
Plug 'jparise/vim-graphql'

" === === === "


" https://github.com/sheerun/vim-polyglot
" A collection of language packs for Vim
" Plug 'sheerun/vim-polyglot'

" https://github.com/suan/vim-instant-markdown
" Instant Markdown previews from VIm
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}


" === Ruby === "
Plug 'vim-ruby/vim-ruby' " https://vimawesome.com/plugin/vim-ruby
Plug 'tpope/vim-rails'
" === === ===


" === THEMES === "
" https://github.com/tpope/vim-vividchalk
"Plug 'tpope/vim-vividchalk'
"Plug 'ParamagicDev/vim-medic_chalk'
" Theme: https://github.com/franbach/miramare
Plug 'franbach/miramare'

" Theme: https://github.com/sainnhe/sonokai
Plug 'sainnhe/sonokai'

" https://github.com/junegunn/fzf.vim
" fzf is a general-purpose command-line fuzzy finder.
" It's an interactive Unix filter for command-line that can be used with any list; files, command history, processes, hostnames, bookmarks, git commits, etc.
" Requires: brew install the_silver_searcher
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()

" Auto save
let g:auto_save=0
" EMMET
let g:user_emmet_leader_key=','

colorscheme sonokai 
syntax on " enable syntax processing
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
set clipboard=unnamed
" set cursorcolumn 
" hi CursorColumn ctermbg=8
" https://stackoverflow.com/questions/15277241/changing-vim-gutter-color
highlight clear SignColumn

" ALE
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
" let g:ale_change_sign_column_color=1
" set background=dark
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
highlight ALEWarning ctermbg=NONE

" vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1

" Fix color scheme issues in TMUX:
" https://github.com/tmux/tmux/issues/699#issuecomment-269572025
set background=dark
set t_Co=256

" NERDTree
let NERDTreeShowHidden = 1
nnoremap <silent> ,nrdt :NERDTree<CR>
nnoremap <silent> ,nrdf :NERDTreeFind<CR>

command! MakeTags !ctags -R .


nnoremap <silent> <C-S> :FZF<CR>
nnoremap <silent> <S-S> :Ag<CR>


" === SNIPPETS === "
"<ESC>F{a<CR><CR><ESC>ki<TAB><TAB>
" React:
nnoremap ,rcn i className=""<ESC>i
nnoremap ,ronc i onClick={() => }<ESC>i
nnoremap ,rue ouseEffect(() => {});<ESC>F{a<CR><CR><ESC>ki<TAB><TAB>
nnoremap ,rus oconst [] = useState();<ESC>F[a
nnoremap ,rur oconst  = useRef();<ESC>Ftla
"TODO nnoremap ,comp 

" === TESTS ===
nnoremap ,xtd f.dt(f)i, () => {}<ESC>i<CR><CR><ESC>ki<TAB>
nnoremap ,xtda f.dt(f)i, async () => {}<ESC>i<CR><CR><ESC>ki<TAB>

" JS:
nnoremap ,jimp iimport {  } from "";<CR><ESC>kf{la
nnoremap ,jimpd iimport  from "";<CR><ESC>kftla
nnoremap ,jimpr iimport React from "react";<CR><ESC>kftla
nnoremap ,jmap a.map(() => )<ESC>i
nnoremap ,jfil a.filter(() => )<ESC>i

nnoremap ,jr oreturn ;<ESC>i

nnoremap ,j= a() => <ESC>a
nnoremap ,ja= aasync () => <ESC>a
nnoremap ,j=b a() => {}<ESC>F{a<CR><CR><ESC>ki<TAB><TAB>
nnoremap ,ja=b aasync () => {}<ESC>F{a<CR><CR><ESC>ki<TAB><TAB>

" Markdown
nnoremap ,mdjs i```javascript<CR><CR>```<ESC>ki
nnoremap ,mdr i```ruby<CR><CR>```<ESC>ki
nnoremap ,mdb i```bash<CR><CR>```<ESC>ki

" Misc
nnoremap ,pst :r !pbpaste<CR>
