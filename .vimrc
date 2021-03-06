set nocompatible              " be iMproved, required
filetype off                  " required

"
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"............................................................
"my Bundle here:
"
">>>>>>>>>>>>>>>>>>>>>>>>
"original repos on github
"
"Bundle 'kien/ctrlp.vim'
"Bundle 'dracula/vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-airline/vim-airline'
Bundle 'Valloric/YouCompleteMe'
Bundle 'ternjs/tern_for_vim'
Bundle 'moll/vim-node'
Bundle 'pangloss/vim-javascript'
Bundle 'walm/jshint.vim'
Bundle 'Shutnik/jshint2.vim'
"Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Raimondi/delimitMate'
"Bundle 'kien/rainbow_parentheses.vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'luochen1990/rainbow'
Bundle 'digitaltoad/vim-pug'
">>>>>>>>>>>>>>>>>>>>>>>>
"vimscripts repos
"
"Bundle 'YankRing.vim'
">>>>>>>>>>>>>>>>>>>>>>>>
"non gihut repos
"
"Bundle 'git://git.wincent.com/command-t.git'

"............................................................
" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
filetype on
filetype plugin on
"
" 语法高亮
syntax enable
syntax on
"
"行号
set number
"set nonumber
"
" 在处理未保存或只读文件的时候，弹出确认 
set confirm 
"
" 不要使用vi的键盘模式，而是vim自己的 
" set nocompatible
"
"
"
" 使回格键（backspace）正常处理indent, eol, start等 
set backspace=2 
"
" 缩进
set ts=2
set sw=2
set smartindent
"
" 函数回车缩进
inoremap { {<RETURN><RETURN>}<UP><TAB>
" 输入一个字符时，如果下一个字符也是括号，则删除它，避免出现重复字符
function! RemoveNextDoubleChar(char)
	let l:line = getline(".")
	let l:next_char = l:line[col(".")] " 取得当前光标后一个字符 		 
	if a:char == l:next_char
		execute "normal! l"
	else
		execute "normal! i" . a:char . ""
	end
endfunction
inoremap ) <ESC>:call RemoveNextDoubleChar(')')<CR>a
inoremap ] <ESC>:call RemoveNextDoubleChar(']')<CR>a
inoremap } <ESC>:call RemoveNextDoubleChar('}')<CR>a
"
" 代码折叠
set foldmethod=marker
"
" ........ NERDTree ........
" 使用F2快速调用和隐藏
map <F2> :NERDTreeToggle<CR> 
" 启动时vim自动运行NERDtTree
autocmd vimenter * NERDTree
"
" ...... syntastic ......
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"
" ...... dracula ......
"color dracula
"
" ...... ctrlp ......
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"
" ...... vim-javascript ......
let javascript_enable_domhtmlcss = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
"
"
" ...... jshint2.vim ......
let jshint2_command = '/usr/local/lib/node_modules/.bin/jshint'
let jshint2_read = 1
let jshint2_save = 1
let jshint2_close = 0
let jshint2_confirm = 0
"
"
" ...... vim-indent-guides ......
"let g:indent_guides_start_level =2
"
" ...... rainbow ......
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
"
"
" ...... vim-color-solarized ......
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

"
"
"
