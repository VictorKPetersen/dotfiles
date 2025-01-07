#Ls aliases
alias ls='ls -l --color=auto'
alias la='ls -la --color=auto'

#Grep aliases
alias grep='grep --color=auto'

#Set vim editor to neovim
alias vim='nvim'

# cd aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'

#Git aliases
alias status='git status'
alias log='git log'
alias add='git add'
alias adda='git add -A'
alias fetch='git fetch'
alias pull='git pull'

#File Attribute/Metadata aliases
alias getftextattr='getfattr --encoding=text --dump'

#SSH agent Aliases
alias ssh-start='eval "$(ssh-agent -s)"'
