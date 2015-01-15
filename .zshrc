#color{{{
autoload colors zsh/terminfo  
colors
 
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
eval _$color='%{$terminfo[bold]$fg[${(L)color}]%}'
eval $color='%{$fg[${(L)color}]%}'
(( count = $count + 1 ))
done
FINISH="%{$terminfo[sgr0]%}"
#}}}
 
#������ʾ��
RPROMPT=$(echo "$RED%D %T$FINISH")
PROMPT=$(echo "\n$CYAN%n@$YELLOW%M:$GREEN%/$_YELLOW>\n$FINISH")
 
#PROMPT=$(echo "$BLUE%M$GREEN%/
#$CYAN%n@$BLUE%M:$GREEN%/$_YELLOW>>>$FINISH ")
#����������������ʽ{{{
case $TERM in (*xterm*|*rxvt*|(dt|k|E)term)
precmd () { print -Pn "\e]0;%n@%M//%/\a" }
preexec () { print -Pn "\e]0;%n@%M//%/\ $1\a" }
;;
esac
#}}}
 
#�༭��
export EDITOR=vim
#���뷨
export XMODIFIERS="@im=ibus"
export QT_MODULE=ibus
export GTK_MODULE=ibus
#������ʷ��¼������ {{{
#��ʷ��¼��Ŀ����
export HISTSIZE=10000
#ע���󱣴����ʷ��¼��Ŀ����
export SAVEHIST=10000
#��ʷ��¼�ļ�
export HISTFILE=~/.zhistory
#�Ը��ӵķ�ʽд����ʷ��¼
setopt INC_APPEND_HISTORY
#������������������ͬ����ʷ��¼��ֻ����һ��
setopt HIST_IGNORE_DUPS
#Ϊ��ʷ��¼�е��������ʱ���
setopt EXTENDED_HISTORY      
 
#���� cd �������ʷ��¼��cd -[TAB]������ʷ·��
setopt AUTO_PUSHD
#��ͬ����ʷ·��ֻ����һ��
setopt PUSHD_IGNORE_DUPS
 
#������ǰ��ӿո񣬲�����������ӵ���¼�ļ���
setopt HIST_IGNORE_SPACE
#}}}
 
#ÿ��Ŀ¼ʹ�ö�������ʷ��¼{{{
cd() {
builtin cd "$@"                             # do actual cd
fc -W                                       # write current history  file
local HISTDIR="$HOME/.zsh_history$PWD"      # use nested folders for history
if  [ ! -d "$HISTDIR" ] ; then          # create folder if needed
mkdir -p "$HISTDIR"
fi
export HISTFILE="$HISTDIR/zhistory"     # set new history file
touch $HISTFILE
local ohistsize=$HISTSIZE
HISTSIZE=0                              # Discard previous dir's history
HISTSIZE=$ohistsize                     # Prepare for new dir's history
fc -R                                       #read from current histfile
}
mkdir -p $HOME/.zsh_history$PWD
export HISTFILE="$HOME/.zsh_history$PWD/zhistory"
 
function allhistory { cat $(find $HOME/.zsh_history -name zhistory) }
function convhistory {
sort $1 | uniq |
sed 's/^:\([ 0-9]*\):[0-9]*;\(.*\)/\1::::::\2/' |
awk -F"::::::" '{ $1=strftime("%Y-%m-%d %T",$1) "|"; print }'
}
#ʹ�� histall ����鿴ȫ����ʷ��¼
function histall { convhistory =(allhistory) |
sed '/^.\{20\} *cd/i\\' }
#ʹ�� hist �鿴��ǰĿ¼��ʷ��¼
function hist { convhistory $HISTFILE }
 
#ȫ����ʷ��¼ top50
function top50 { allhistory | awk -F':[ 0-9]*:[0-9]*;' '{ $1="" ; print }' | sed 's/ /\n/g' | sed '/^$/d' | sort | uniq -c | sort -nr | head -n 50 }
 
#}}}
 
#���� {{{
#�����ڽ���ģʽ��ʹ��ע��  ���磺
#cmd #����ע��
setopt INTERACTIVE_COMMENTS      
 
#�����Զ� cd������Ŀ¼���س�����Ŀ¼
#��΢�е���ң����� cd ��ȫʵ��
setopt AUTO_CD
 
#��չ·��
#/v/c/p/p => /var/cache/pacman/pkg
setopt complete_in_word
 
#���� core dumps
#limit coredumpsize 0
 
#Emacs��� ����
bindkey -e
#bindkey -v
#���� [DEL]�� Ϊ���ɾ��
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^H"    delete-char

 
#�����ַ���Ϊ���ʵ�һ����
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'
#}}}
 
#�Զ���ȫ���� {{{
setopt AUTO_LIST
setopt AUTO_MENU
#������ѡ���ȫʱ��ֱ��ѡ�в˵���
setopt MENU_COMPLETE
 
autoload -U compinit
compinit
 
#�Զ���ȫ����
#zstyle ':completion::complete:*' use-cache on
#zstyle ':completion::complete:*' cache-path .zcache
#zstyle ':completion:*:cd:*' ignore-parents parent pwd
 
#�Զ���ȫѡ��
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select
zstyle ':completion:*:*:default' force-list always
zstyle ':completion:*' select-prompt '%SSelect:  lines: %L  matches: %M  [%p]'
 
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate
 
#·����ȫ
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'
 
#��ɫ��ȫ�˵�
if whence dircolors >/dev/null; then
	eval "$(dircolors -b ~/.dir_colors)"
fi
zmodload zsh/complist
export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export ZLSCOLORS="${LS_COLORS}"
zstyle ':completion:*:default' list-colors 'gxfxbEaEBxxEhEhBaDaCaD'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
 
#������Сд
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
#����У��
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
 
#kill ���ȫ
compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:processes' command 'ps -au$USER'
 
#��ȫ������ʾ����
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'
zstyle ':completion:*:corrections' format $'\e[01;32m -- %d (errors: %e) --\e[0m'
 
# cd ~ ��ȫ˳��
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
#}}}
 
##�б༭����ģʽ {{{
# Ctrl+@ ���ñ�ǣ���Ǻ͹���֮��Ϊ region
zle_highlight=(region:bg=magenta #ѡ������
special:bold      #�����ַ�
isearch:underline)#����ʱʹ�õĹؼ���
#}}}
 
##����(���������)��ȫ "cd " {{{
user-complete(){
case $BUFFER in
"" )                       # �������� "cd "
BUFFER="cd "
zle end-of-line
zle expand-or-complete
;;
"cd --" )                  # "cd --" �滻Ϊ "cd +"
BUFFER="cd +"
zle end-of-line
zle expand-or-complete
;;
"cd +-" )                  # "cd +-" �滻Ϊ "cd -"
BUFFER="cd -"
zle end-of-line
zle expand-or-complete
;;
* )
zle expand-or-complete
;;
esac
}
zle -N user-complete
bindkey "\t" user-complete
#}}}
 
##������ǰ���� sudo {{{
#���幦��
sudo-command-line() {
[[ -z $BUFFER ]] && zle up-history
[[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
zle end-of-line                 #����ƶ�����ĩ
}
zle -N sudo-command-line
#�����ݼ�Ϊ�� [Esc] [Esc]
#bindkey "\e\e" sudo-command-line
#}}}
 
#������� {{{
#alias cp='cp -i'
#alias mv='mv -i'
#alias rm='rm -i'
alias ls='ls -FG'
alias ll='ls -alG'
alias grep='grep --color=auto'
alias la='ls -aG'
alias scp='nocorrect scp'
alias hadoop='nocorrect hadoop'
alias astyle='nocorrect astyle'
#alias pacman='sudo pacman-color'
#alias p='sudo pacman-color'
#alias y='yaourt'
#alias h='htop'
#alias vim='sudo vim'
alias vi='vim'
function find_task()
{
	ps aux| grep -v grep| grep $1 --color;
}
alias ftask='find_task'

#export HADOOP_HOME=/search/shaolong/app/context-hadoop-client/hadoop
#export PATH=/search/shaolong/app/tmppy273/bin:$PATH
#export PATH=/search/shaolong/app/bin:$PATH
#export PATH=/search/shaolong/app/local/php/bin:$PATH
#export PATH=/search/shaolong/app/local/bin:$PATH
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/search/shaolong/app/tmppy273/lib/
#export PATH=$HADOOP_HOME/bin:$PATH
#export PATH=/search/shaolong/app/vim73/bin:$PATH
export PATH=/usr/local/Cellar/vim/7.4.335/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/

 
#[Esc][h] man ��ǰ����ʱ����ʾ���˵��
alias run-help >&/dev/null && unalias run-help
autoload run-help
 
#��ʷ���� top10
alias top10='print -l  ${(o)history%% *} | uniq -c | sort -nr | head -n 10'
#}}}
 
#·������ {{{
#������Ӧ��·��ʱֻҪ cd ~xxx
hash -d trunk="~/trunk/app/ecom/nova/se/se-as/"
hash -d cq="~/cq/app/ecom/nova/se/se-as/"
hash -d as="/search/shaolong/as_trunk/add/Code/Context/Qt/AdvanceServer/"
#}}}
 
##for Emacs {{{
#�� Emacs�ն� ��ʹ�� Zsh ��һЩ���� ���Ƽ��� Emacs ��ʹ����
#if [[ "$TERM" == "dumb" ]]; then
#setopt No_zle
#PROMPT='%n@%M %/
#>>'
#alias ls='ls -F'
#fi
#}}}
 
#{{{�Զ��岹ȫ
#��ȫ ping
zstyle ':completion:*:ping:*' hosts 192.168.1.{1,50,51,100,101} www.google.com
 
#��ȫ ssh scp sftp ��
zstyle -e ':completion::*:*:*:hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
#}}}
 
#{{{ F1 ������
arith-eval-echo() {
LBUFFER="${LBUFFER}echo \$(( "
RBUFFER=" ))$RBUFFER"
}
zle -N arith-eval-echo
bindkey "^[[11~" arith-eval-echo
#}}}
 
####{{{
function timeconv { date -d @$1 +"%Y-%m-%d %T" }
 
# }}}
 
zmodload zsh/mathfunc
autoload -U zsh-mime-setup
zsh-mime-setup
setopt EXTENDED_GLOB
#autoload -U promptinit
#promptinit
#prompt redhat
 
setopt correctall
autoload compinstall
 
#Ư����ʵ�õ������������
#setopt extended_glob
# TOKENS_FOLLOWED_BY_COMMANDS=('|' '||' ';' '&' '&&' 'sudo' 'do' 'time' 'strace')
 
# recolor-cmd() {
#     region_highlight=()
#     colorize=true
#     start_pos=0
#     for arg in ${(z)BUFFER}; do
#         ((start_pos+=${#BUFFER[$start_pos+1,-1]}-${#${BUFFER[$start_pos+1,-1]## #}}))
#         ((end_pos=$start_pos+${#arg}))
#         if $colorize; then
#             colorize=false
#            res=$(LC_ALL=C builtin type $arg 2>/dev/null)
#             case $res in
#                 *'reserved word'*)   style="fg=magenta,bold";;
#                 *'alias for'*)       style="fg=cyan,bold";;
#                 *'shell builtin'*)   style="fg=yellow,bold";;
#                 *'shell function'*)  style='fg=green,bold';;
#                 *"$arg is"*)
#                     [[ $arg = 'sudo' ]] && style="fg=red,bold" || style="fg=cyan,bold";;
#                 *)                   style='none,bold';;
#             esac
#             region_highlight+=("$start_pos $end_pos $style")
#         fi
#         [[ ${${TOKENS_FOLLOWED_BY_COMMANDS[(r)${arg//|/\|}]}:+yes} = 'yes' ]] && colorize=true
#         start_pos=$end_pos
#     done
# }
#check-cmd-self-insert() { zle .self-insert && recolor-cmd }
#check-cmd-backward-delete-char() { zle .backward-delete-char && recolor-cmd }
# 
#zle -N self-insert check-cmd-self-insert
#zle -N backward-delete-char check-cmd-backward-delete-char
#
#
fpath=(/usr/local/share/zsh-completions $fpath)

