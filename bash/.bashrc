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

export ANDROID_HOME=$HOME/Android/Sdk/


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-cli/google-cloud-sdk/path.bash.inc' ]; then . '/opt/google-cloud-cli/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/google-cloud-cli/google-cloud-sdk/completion.bash.inc' ]; then . '/opt/google-cloud-cli/google-cloud-sdk/completion.bash.inc'; fi
