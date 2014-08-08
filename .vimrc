"set mouse=a
"set mousemodel=popup
set nocompatible            " 关闭 vi 兼容模式
syntax on                   " 自动语法高亮
colorscheme desert			" 设定配色方案
set number                  " 显示行号
set ruler                   " 打开状态栏标尺
set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4               " 设定 tab 长度为 4
set nobackup                " 覆盖文件时不备份
"set background 
filetype plugin indent on   " 开启插件
filetype on
filetype plugin on
set showmode showmatch
set backupcopy=yes          " 设置备份时的行为为覆盖
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
"set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set wrapscan                " 在搜索到文件两端时重新搜索
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本
set noerrorbells            " 关闭错误信息响铃
set novisualbell            " 关闭使用可视响铃代替呼叫
set t_vb=                   " 置空错误铃声的终端代码
"set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号
"set matchtime=2             " 短暂跳转到匹配括号的时间
set magic                   " 设置魔术
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set smartindent             " 开启新行时使用智能自动缩进
set backspace=indent,eol,start
                            " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set completeopt=menu
set cmdheight=1             " 设定命令行的行数为 1
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
                            " 设置在状态行显示的信息
set foldenable              " 开始折叠
set foldmethod=syntax

set encoding=GB2312
set termencoding=UTF8
set foldcolumn=1            " 设置折叠区域的宽度
set fileencodings=ucs-bom,utf-8,euc-cn,gb2312,gbk,cp936,gb18030,big5,euc-jp,euc-kr,latin1
setlocal foldlevel=2        " 设置折叠层数为
set foldclose=all           " 设置为自动关闭折叠                            
hi PmenuSel  term=reverse ctermfg=7 ctermbg=4  guibg=DarkBlue
hi Folded term=bold ctermfg=3 gui=bold guifg=khaki
hi FoldColumn term=bold ctermfg=3 gui=bold guifg=khaki
hi PreProc  term=standout cterm=bold ctermfg=6 ctermbg=0 guifg=Cyan guibg=Grey
hi Constant term=bold cterm=bold ctermfg=3 gui=bold guifg=Yellow
hi Type term=standout cterm=bold ctermfg=2 gui=bold guifg=springgreen
hi Cursor term=reverse cterm=reverse gui=reverse
hi CursorColumn term=reverse cterm=reverse gui=reverse
hi Comment term=bold ctermfg=2 gui=bold guifg=SeaGreen
hi Number term=bold  cterm=bold ctermfg=1 gui=bold guifg=salmon
hi Constant term=bold ctermfg=3 gui=bold guifg=khaki
hi Identifier term=standout cterm=bold ctermfg=6 ctermbg=0 guifg=Cyan guibg=Grey
hi Statement term=underline ctermfg=6 guifg=palegreen
"let g:indent_guides_start_level = 1
let g:indent_guides_auto_colors = 1 
let g:indent_guides_guide_size = 1
""hi IndentGuidesOdd term=reverse ctermbg=4 gui=undercurl guisp=Blue
""hi IndentGuidesEven term=reverse ctermbg=4 gui=undercurl guisp=Blue
hi IndentGuidesOdd  guibg=red   ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4
"
"让vim记忆上次编辑的位置
autocmd BufReadPost *
			\ if line("'\"")>0&&line("'\"")<=line("$") |
			\	exe "normal g'\"" |
			\ endif
"让vim记忆上次编辑的位置

nnoremap <tab> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
                            " 用tab 键来开关折叠

autocmd FileType c,cpp,python,sh set et nu sw=4 ts=4 colorcolumn=100
autocmd FileType python set foldmethod=indent
"autocmd FileType python set omnifunc=pythoncomplete#Complete  
let g:jedi#popup_on_dot = 0

"let g:DoxygenToolkit_commentType="C++"

set completeopt=menu,menuone " 关掉智能补全时的预览窗口

let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
let OmniCpp_GlobalScopeSearch=1 " enable the global scope search
let OmniCpp_DisplayMode=1 " Class scope completion mode: always show all members
let OmniCpp_DefaultNamespaces=["std"]
let OmniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the last column
let OmniCpp_ShowAccess=1 

map <F11> :!ctags -R --languages=+C,+C++,-Asm,-Asp,-Awk,-BETA,-Cobol,-Eiffel,-Erlang,-Fortran,-HTML,-Java,-JavaScript,-Lisp,-Lua,-Make,-Pascal,-Perl,-PHP,+Python,-REXX,-Ruby,-Scheme,-Sh,-SLang,-SML,-SQL,-Tcl,-Vera,-Verilog,-Vim,-YACC --c++-kinds=+p --fields=+aiKSz --fields=+lS  --extra=+q --sort=yes --tag-relative=no `pwd`<CR>
map , :tabp<CR>
map . :tabn<CR>
map <F9> :tabnew .<CR>
map <F3> : set number<CR>:set mouse=a<CR>:set foldcolumn=1<CR> 
map <F4> : set nonumber<CR>:set mouse=c<CR>:set foldcolumn=0<CR> 

function InsertHeadDef(firstLine, lastLine)
    if a:firstLine <1 || a:lastLine> line('$')
        echoerr 'InsertHeadDef : Range overflow !(FirstLine:'.a:firstLine.';LastLine:'.a:lastLine.';ValidRange:1~'.line('$').')'
        return ''
    endif
    let sourcefilename=expand("%:t")
    let definename=substitute(sourcefilename,' ','','g')
    let definename=substitute(definename,'\.','_','g')
    let definename = toupper(definename)
    exe 'normal '.a:firstLine.'GO'
    call setline('.', '#ifndef _'.definename."_")
    normal ==o
    call setline('.', '#define _'.definename."_")
    exe 'normal =='.(a:lastLine-a:firstLine+1).'jo'
    call setline('.', '#endif')
    let goLn = a:firstLine+2
    exe 'normal =='.goLn.'G'
endfunction
function InsertHeadDefN()
    let firstLine = 1
    let lastLine = line('$')
    let n=1
    while n < 20
        let line = getline(n)
        if n==1 
            if line =~ '^\/\*.*$'
                let n = n + 1
                continue
            else
                break
            endif
        endif
        if line =~ '^.*\*\/$'
            let firstLine = n+1
            break
        endif
        let n = n + 1
    endwhile
    call InsertHeadDef(firstLine, lastLine)
endfunction
nmap he :call InsertHeadDefN()<CR>

"进行版权声明的设置
"添加或更新头
nmap ti :call TitleC()<cr>'s
nmap py :call TitlePython()<cr>'s
function TitlePython()
    let n=1
    "默认为添加
    while n < 10
        let line = getline(n)
        if line =~ '^\#\s*\S*Last\smodified:\S*.*$'
            call UpdateTitlePython()
            return
        endif
        let n = n + 1
    endwhile
    call append(0,"#!/bin/env python")
	call append(1,"#encoding=utf-8")
    call append(2,"# Author: shaolong - shaolong@sogou-inc.com")
    call append(3,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(4,"# Filename: ".expand("%:t"))
    call append(5,"# Description: ")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction
function AddTitleC()
    call append(0,"/**")
    call append(1," * @author: shaolong - shaolong@sogou-inc.com")
    call append(2," * @last modified ".strftime("%Y-%m-%d %H:%M"))
    call append(3," * @file ".expand("%:t"))
    call append(4," * @description ")
    call append(5," */")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction
"更新最近修改时间和文件名
function UpdateTitleC()
    normal m'
    execute '/ * @last modified/s@\S\S\S\S-\S\S-\S\S .*$@\=strftime("%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/ * @file/s@\s\S*$@\=" ".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction
function UpdateTitlePython()
    normal m'
	execute '/# *Last modified:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M")@'
    normal ''
    normal mk
	execute '/# *Filename:/s@:.*$@\=": ".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction
"判断前10行代码里面，是否有Last modified这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
function TitleC()
    let n=1
    "默认为添加
    while n < 10
        let line = getline(n)
        if line =~ '^ \* @last\smodified\s*\S*.*$'
            call UpdateTitleC()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitleC()
endfunction


nmap <silent> <F12> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 40
let g:tagbar_left = 1 "在左侧显示tagbar

"indent guide:

"To have the numeric keypad working with putty / vim
:imap <Esc>Oq 1
:imap <Esc>Or 2
:imap <Esc>Os 3
:imap <Esc>Ot 4
:imap <Esc>Ou 5
:imap <Esc>Ov 6
:imap <Esc>Ow 7
:imap <Esc>Ox 8
:imap <Esc>Oy 9
:imap <Esc>Op 0
:imap <Esc>On .
:imap <Esc>OQ /
:imap <Esc>OR *
:imap <Esc>Ol +
:imap <Esc>OS -

"-----------------------------------Bundle -plugin manageer--------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
" ...
"My Plugin
Plugin 'matrix.vim--Yang'
Plugin 'Tagbar'
Plugin 'DoxygenToolkit.vim'
Plugin 'OmniCppComplete'
Plugin 'https://github.com/Lokaltog/vim-powerline.git'
Plugin 'Indent-Guides'
Plugin 'https://github.com/terryma/vim-multiple-cursors'
Plugin 'https://github.com/Valloric/YouCompleteMe'
"Bundle 'https://github.com/kevinw/pyflakes-vim'
"Bundle 'https://github.com/rkulla/pydiction'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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

 
" --------------vim-powerline config----------------------
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'unicode'
set encoding=utf-8

"--------------pydicition---------------------
filetype plugin on
"let g:pydiction_location ='~/.vim/bundle/pydiction/complete-dict'
