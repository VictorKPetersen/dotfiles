#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

PS1='[\u@\h \W]\$ '

#Config git alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Set colorscheme to pywal output
(cat ~/.cache/wal/sequences &)

# Init starship prompt
eval "$(starship init bash)"

