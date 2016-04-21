OS=`uname`

export LS_OPTIONS='--color=auto'
if [[ "$OS" == "Darwin" ]]; then
  PORTSBIN="/usr/local/bin"
  DIRCOLORS="$PORTSBIN/gdircolors"
  alias ls="$PORTSBIN/gls $LS_OPTIONS "
  alias vi='mvim -v'
  alias vim='mvim -v'
  alias gvim='mvim -v'
else
  DIRCOLORS='/usr/bin/dircolors'
  alias ls="ls $LS_OPTIONS "
fi

eval `$DIRCOLORS ~/.dir_colors`

if [[ "$OS" == "Darwin" ]]; then
  export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
fi

export CLI_COLOR='Yes'
set -o vi
alias grep='grep --color=auto'
alias gvim='gvim -geom 82x35'
alias hist='grep '$1' $HOME/.zsh_history'
alias mem='free -m'
alias la='ls -al'
alias f='find |grep'
alias lsd='ls -ld *(-/DN)'
alias c='clear'
alias p='pushd .'
alias u='popd'
alias td='tmux detach'
alias ll='ls -alh'
alias vi='vim'
alias v='vim'
alias hnl="git --no-pager log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short"
alias hist="git log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short"
alias a='ack'
alias fuck='sudo !!'
rationalise-dot() {
    if [[ $LBUFFER = *.. ]]; then
        LBUFFER+=/..
    else
        LBUFFER+=.
    fi
}
zle -N rationalise-dot
bindkey . rationalise-dot

r() {
    SSH_AUTH_SOCK=`tmux showenv|grep "^SSH_AUTH_SOCK" | cut -d = -f 2`
}

export GOPATH=$HOME/workspace/GoPath
export PATH=$PATH:$GOPATH/bin

source ~/.scripts/tmuxinator.zsh

export ERL_LIBS="$HOME/.erl_libs/"
alias erl="kjell "

