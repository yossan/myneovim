"<leader>をoptionから','に変更
let mapleader=","
" terminalと同一カラーにしたけれど、エラーの背景が変わらないため一旦見送り
set termguicolors

"{{{ minpac
packadd minpac
call minpac#init()

"call minpac#add('github/copilot.vim')

" color scheme
"call minpac#add('morhetz/gruvbox')
"colorscheme gruvbox

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Snippets
call minpac#add('SirVer/ultisnips')
" call minpac#add('honza/vim-snippets')

"let g:UltiSnipsExpandTrigger="<tab>"

" list all snippets for current filetype
" let g:UltiSnipsListSnippets="<c-l>"

" How to use ultisnips
" Type the “snippet trigger” (listed below in the 1st column) and press TAB in insert mode to evaluate the snippet block.
" Use Ctrl + j to jump forward within the snippet.
" Use Ctrl + k to jump backward oithin the snippet.
" Use Ctrl + l to list all the snippets available for the current file-type
" Below are some of the most common snippets you should start using right now!

" How to create your own snippets
" vim-snippets stores its code-snippets in 2 different directories:
" 
" $HOME/.config/nvim/plugged/vim-snippets/snippets/ snipMate compatible
" $HOME/.config/nvim/plugged/vim-snippets/UltiSnips/ for people who use vim-snippets with ultisnips (the snippet format is different)
" The variable g:UltiSnipsSnippetDirectories can be used to specify different locations to look for snippets
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']

" NERDTree
call minpac#add('preservim/nerdtree')
" open NERDTree with `Ctrl+n` 
nnoremap <C-n> :call NERDTreeOpen()<CR>
let g:NERDTreeNodeDelimiter = "\u00a0"
function! NERDTreeOpen()
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
	  NERDTreeToggle
  else
	  NERDTreeCWD
  endif
endfunction

" memolist
call minpac#add('glidenote/memolist.vim')
let g:memolist_path = "~/Dropbox/memolist/"

" ale
"call minpac#add('w0rp/ale')
"let g:ale_completion_enabled = 1
"let g:ale_set_highlights = 0

" Language server
call minpac#add('neoclide/coc.nvim', {'branch': 'release'})

" QuickRun
call minpac#add('thinca/vim-quickrun')
"let g:quickrun_config = {}
"nnoremap <leader>r <Plug>(quickrun)
for [key, com] in items({
\   '<Leader>x' : '>message',
\   '<Leader>p' : '-runner shell',
\   '<Leader>w' : '>buffer',
\   '<Leader>q' : '>>buffer',
\ })
	execute 'nnoremap <silent>' key ':QuickRun' com '-mode n<CR>'
	execute 'vnoremap <silent>' key ':QuickRun' com '-mode v<CR>'
endfor

" Tagbar
call minpac#add('preservim/tagbar')
nmap <leader>n :TagbarToggle<CR>

command! PackUpdate call minpac#update()
command! PackClean  call minpac#clean()
"}}}


" コピーすると文字化けする
lang en_US.UTF-8

" foldをfoldmarkerに変更する
set foldmethod=marker

" 検索ハイライトをONにする
set hlsearch

" 見た目上で移動
nnoremap j gj
nnoremap k gk

" 検索ハイライトを一時的に無効化する
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
"検索で大文字小文字を区別しない
"set ignorecase
"検索文字に大文字を含んだときのみ、大文字小文字を区別する
set smartcase
" 画面をクリアしてから再描画する
" <C-l> help CTRL-L
" 検索ハイライトを一時的に無効化する (クリアする)
":nohlsearch
" 検索ハイライトを消す
" let @/=""
" 検索を入力するたびに自動的に検索させていく。(デフォルトではエンターを押す必要がある)
set incsearch
" 検索単語補完
" <C-r><C-w>

"cancel <C-@>
inoremap <C-@> <ESC>

"newline
inoremap <expr> <cr> pumvisible()? "\<c-y>" : "\<c-g>u<cr>"
"move buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Default indentation
set noexpandtab ts=4 sw=0 sts=-1

" quickfix
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [q :cprevious<CR>

" terminal上でスクロールする
tnoremap <c-b> <c-\><c-n>

" AtCoder
" snipeetsファイルを読み込む
aug AtCoder
	au!
	au BufEnter ~/atcoder/**/*.rs UltiSnipsAddFiletypes rust-atcoder
aug END
