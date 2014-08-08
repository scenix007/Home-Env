"set mouse=a
"set mousemodel=popup
set nocompatible            " �ر� vi ����ģʽ
syntax on                   " �Զ��﷨����
colorscheme desert			" �趨��ɫ����
set number                  " ��ʾ�к�
set ruler                   " ��״̬�����
set shiftwidth=4            " �趨 << �� >> �����ƶ�ʱ�Ŀ��Ϊ 4
set softtabstop=4           " ʹ�ð��˸��ʱ����һ��ɾ�� 4 ���ո�
set tabstop=4               " �趨 tab ����Ϊ 4
set nobackup                " �����ļ�ʱ������
"set background 
filetype plugin indent on   " �������
filetype on
filetype plugin on
set showmode showmatch
set backupcopy=yes          " ���ñ���ʱ����ΪΪ����
set ignorecase smartcase    " ����ʱ���Դ�Сд��������һ�������ϴ�д��ĸʱ�Ա��ֶԴ�Сд����
"set nowrapscan              " ��ֹ���������ļ�����ʱ��������
set wrapscan                " ���������ļ�����ʱ��������
set incsearch               " ������������ʱ����ʾ�������
set hlsearch                " ����ʱ������ʾ���ҵ����ı�
set noerrorbells            " �رմ�����Ϣ����
set novisualbell            " �ر�ʹ�ÿ�������������
set t_vb=                   " �ÿմ����������ն˴���
"set showmatch               " ��������ʱ�����ݵ���ת��ƥ��Ķ�Ӧ����
"set matchtime=2             " ������ת��ƥ�����ŵ�ʱ��
set magic                   " ����ħ��
set hidden                  " ��������δ������޸�ʱ�л�����������ʱ���޸��� vim ���𱣴�
set guioptions-=T           " ���ع�����
set guioptions-=m           " ���ز˵���
set smartindent             " ��������ʱʹ�������Զ�����
set backspace=indent,eol,start
                            " ���趨�ڲ���״̬�޷����˸���� Delete ��ɾ���س���
set completeopt=menu
set cmdheight=1             " �趨�����е�����Ϊ 1
set laststatus=2            " ��ʾ״̬�� (Ĭ��ֵΪ 1, �޷���ʾ״̬��)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
                            " ������״̬����ʾ����Ϣ
set foldenable              " ��ʼ�۵�
set foldmethod=syntax

set encoding=GB2312
set termencoding=UTF8
set foldcolumn=1            " �����۵�����Ŀ��
set fileencodings=ucs-bom,utf-8,euc-cn,gb2312,gbk,cp936,gb18030,big5,euc-jp,euc-kr,latin1
setlocal foldlevel=2        " �����۵�����Ϊ
set foldclose=all           " ����Ϊ�Զ��ر��۵�                            
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
"��vim�����ϴα༭��λ��
autocmd BufReadPost *
			\ if line("'\"")>0&&line("'\"")<=line("$") |
			\	exe "normal g'\"" |
			\ endif
"��vim�����ϴα༭��λ��

nnoremap <tab> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
                            " ��tab ���������۵�

autocmd FileType c,cpp,python,sh set et nu sw=4 ts=4 colorcolumn=100
autocmd FileType python set foldmethod=indent
"autocmd FileType python set omnifunc=pythoncomplete#Complete  
let g:jedi#popup_on_dot = 0

"let g:DoxygenToolkit_commentType="C++"

set completeopt=menu,menuone " �ص����ܲ�ȫʱ��Ԥ������

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

"���а�Ȩ����������
"��ӻ����ͷ
nmap ti :call TitleC()<cr>'s
nmap py :call TitlePython()<cr>'s
function TitlePython()
    let n=1
    "Ĭ��Ϊ���
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
"��������޸�ʱ����ļ���
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
"�ж�ǰ10�д������棬�Ƿ���Last modified������ʣ�
"���û�еĻ�������û����ӹ�������Ϣ����Ҫ����ӣ�
"����еĻ�����ôֻ��Ҫ���¼���
function TitleC()
    let n=1
    "Ĭ��Ϊ���
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
let g:tagbar_left = 1 "�������ʾtagbar

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
