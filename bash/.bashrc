[[ $- == *i* ]] && stty -ixon
shopt -s histappend
HISTSIZE=HISTFILESIZE
HISTCONTROL=ignoreboth

export XDG_CONFIG_HOME=$HOME/.config

mkdir -p $XDG_CONFIG_HOME

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias svim="sudo vim"
alias code="vim -u ~/.vim/project.vim"

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

parse_git() {
  if [[ ( -z "${NO_GIT}" ) && ( -n "$(git rev-parse --git-dir 2>/dev/null)" ) ]]
  then
    BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')
    SUMMARY=$(git diff --shortstat)
    echo -e "\n${BRANCH}${SUMMARY}\n"
  fi
}

export PS1="\
${C}0;97m\]\u@\h :: \A :: [ ${C}1;36m\]\w${C}0;97m\] ]\
${C}0;95m\]\$(parse_git)${C}0;97m\]\
\n\$ ${N}\
"

#if [ -x "$(command -v yarn)" ]; then
#  export PATH=$(yarn global bin):$PATH
#fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

if [ -d /usr/local/go/bin ]; then
  export PATH=/usr/local/go/bin:$PATH
fi

HAS_GO=$(which go 2>/dev/null)
if [ -f "${HAS_GO}" ]; then
  if [ -d /var/proto/go ]; then
    export GOPATH=/var/proto/go
    export GOHOME=$GOPATH/src/github.com/aewens
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

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature
# export SYSTEMD_PAGER=

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
