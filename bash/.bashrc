stty -ixon
shopt -s histappend
HISTSIZE=HISTFILESIZE
HISTCONTROL=ignoreboth

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

alias svim="sudo vim"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export EDITOR=vim
export VISUAL=vim
if [ $TERM == "screen" ]; then
    export TERM=screen-256color
fi

C="\[\033["
N="${C}m\]"

export PS1="${C}0;97m\]\u@\h :: \A :: [ ${C}1;36m\]\w${C}0;97m\] ]\n\$ ${N}"

if [ -x "$(command -v yarn)" ]; then
    export PATH=$(yarn global bin):$PATH
fi

if [ -d /usr/local/go/bin ]; then
    export PATH=/usr/local/go/bin:$PATH
fi

HAS_GO=$(which go)
if [ -f "${HAS_GO}" ]; then
    if [ -d /var/proto/go ]; then
        export GOPATH=/var/proto/go
    fi

    export PATH=$PATH:$(go env GOPATH)/bin

fi

if [ -d $HOME/.scripts ]; then
    export PATH=$HOME/.scripts:$PATH
fi

if [ -d $HOME/.bin ]; then
    export PATH=$HOME/.bin:$PATH
fi

if [ -f ~/.bashrc.local ]; then
    . ~/.bashrc.local
fi
