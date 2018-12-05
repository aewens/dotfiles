stty -ixon
shopt -s histappend
HISTSIZE=HISTFILESIZE
HISTCONTROL=ignoreboth

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

alias svim="sudo vim"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias apachelog='tail /var/log/apache2/error.log'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

C="\[\033["
N="${C}m\]"

export PS1="${C}0;97m\]\u@\h :: [ ${C}1;36m\]\w${C}0;97m\] ]\n\$ ${N}"
export PATH=$PATH:$HOME/.bin
