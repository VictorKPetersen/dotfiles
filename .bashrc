#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

PS1='[\u@\h \W]\$ '

# Init starship prompt
eval "$(starship init bash)"
alias config='/usr/bin/git --git-dir=/home/terra/.cfg/ --work-tree=/home/terra'
