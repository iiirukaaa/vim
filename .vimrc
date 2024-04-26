" 行番号を表示
set number

"utf-8
set encoding=utf-8
scriptencoding utf-8

" かっこ補完
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

"" VSCode風にする
" ref : https://qiita.com/youichiro/items/b4748b3e96106d25c5bc

call plug#begin()
" plugin
" install : ":PlugInstall"
" delete  : ":PlugClean"

" ステータスバーをいい感じにするやつ
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" vim-airlineも同じカラースキームを適用するためのプラグイン
Plug 'tomasiser/vim-code-dark'

" ファイルツリーの表示
Plug 'lambdalisue/fern.vim'
"" [:Fern .]でウィンドウにファイルツリー表示
"" [:Fern . -drawer]でサイドバーのように左側にファイルツリーを表示

" ファイルツリーにgitの差分を表示する
Plug 'lambdalisue/fern-git-status.vim'


" アイコンフォント
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
" アイコンカラー
Plug 'lambdalisue/glyph-palette.vim'

call plug#end()


let g:airline#extensions#tabline#enabled = 1

"" vim-airline
" ステータスラインに表示する項目を変更する
let g:airline#extensions#default#layout = [
			\[ 'a' , 'b' , 'c' ],
			\['z']
			\]
let g:airline_section_c = '%t %M'
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'
" 変更がなければdiffの行数を表示しない
let g:airline#extensions#hunks#non_zero_only = 1

" タブラインの表示を変更する
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#show_closse_button = 0

" VSCode風
colorscheme codedark

let g:airline_theme = 'codedark'

" ファイルツリー
" -reveal=% : 現在開いているファイルにフォーカス
"  -toggle  : 表示・非表示の切り替え
"  -width   : 幅
" Ctrl + nで表示
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>

" アイコン表示有効化
let g:fern#renderer = 'nerdfont'
" アイコンに色を付ける
augroup my-glyph-palette
	autocmd! *
	autocmd FileType fern call glyph_palette#apply()
	autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END
